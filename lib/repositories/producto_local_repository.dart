import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../database/app_database.dart';
import 'package:emprendi_app/consts/status_consts.dart';
import 'package:emprendi_app/models/producto.dart' as model;

class ProductoLocalRepository {
  final AppDatabase db;
  ProductoLocalRepository(this.db);

  Future<ProductosCompanion> agregarProducto({
    required String sku,
    required String nombre,
    required int stock,
    required double precio,
    required double costo,
  }) async {
    final uuid = const Uuid().v4();
    final producto = ProductosCompanion.insert(
      uuid: uuid,
      sku: sku,
      nombre: nombre,
      stock: stock,
      precio: precio,
      costo: costo,
      status: const Value('activo'),
      statusSincronizacion: const Value('creacion_pendiente'),
    );

    await db.into(db.productos).insert(producto);

    return producto;
  }

  Future<List<model.Producto>> listarProductos() async {
    final entities = await db.select(db.productos).get();

    // Mapeamos ProductoEntity a Producto
    return entities
        .map(
          (entity) => model.Producto(
            productoId: entity.uuid,
            sku: entity.sku,
            nombre: entity.nombre,
            stock: entity.stock,
            precio: entity.precio,
            costo: entity.costo,
            status: entity.status,
            registroFecha: entity.registroFecha,
            actualizacionFecha: entity.actualizacionFecha,
            statusSincronizacion: entity.statusSincronizacion,
          ),
        )
        .toList();
  }

  Future<void> upsertProducto(model.Producto p) async {
    final companion = ProductosCompanion(
      uuid: Value(p.productoId ?? const Uuid().v4()),
      sku: Value(p.sku ?? ''),
      nombre: Value(p.nombre ?? ''),
      stock: Value(p.stock ?? 0),
      precio: Value(p.precio ?? 0),
      costo: Value(p.costo ?? 0),
      status: Value(p.status ?? 'activo'),
      registroFecha: Value(p.registroFecha ?? DateTime.now()),
      actualizacionFecha: Value(p.registroFecha),
      statusSincronizacion: const Value(StatusConsts.sincronizado),
    );
    await db.into(db.productos).insertOnConflictUpdate(companion);
  }

  Future<void> actualizarSincronizacion(ProductosCompanion producto) async {
    await db
        .update(db.productos)
        .replace(
          producto.copyWith(
            statusSincronizacion: Value(StatusConsts.sincronizado),
          ),
        );
  }

  Future<ProductosCompanion> editarProducto({
    required String uuid,
    String? sku,
    String? nombre,
    double? precio,
    double? costo,
  }) async {
    // Obtener el producto existente
    final productoExistente = await (db.select(
      db.productos,
    )..where((t) => t.uuid.equals(uuid))).getSingle();

    // Crear un companion con los cambios
    final productoActualizado = ProductosCompanion(
      uuid: Value(uuid), // primary key
      sku: sku != null ? Value(sku) : Value(productoExistente.sku),
      nombre: nombre != null ? Value(nombre) : Value(productoExistente.nombre),
      precio: precio != null ? Value(precio) : Value(productoExistente.precio),
      costo: costo != null ? Value(costo) : Value(productoExistente.costo),
      stock: Value(productoExistente.stock),
      statusSincronizacion: const Value('actualizacion_pendiente'),
    );

    // Actualizar la fila en SQLite
    await db.update(db.productos).replace(productoActualizado);

    return productoActualizado;
  }
}
