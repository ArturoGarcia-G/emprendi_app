import 'package:uuid/uuid.dart';
import 'package:drift/drift.dart';
import '../database/app_database.dart';
import 'package:emprendi_app/models/producto.dart' as model;

class ProductoLocalRepository {
  final AppDatabase db;
  ProductoLocalRepository(this.db);

  Future<ProductosCompanion> insertProducto({
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
      statusSincronizacion: const Value('creacion_pendiente'),
    );

    await db.into(db.productos).insert(producto);

    return producto;
  }

  Future<List<model.Producto>> getProductos() async {
    final entities = await db.select(db.productos).get();

    // Mapeamos ProductoEntity a Producto
    return entities
        .map(
          (e) => model.Producto(
            productoId: e.uuid,
            sku: e.sku,
            nombre: e.nombre,
            stock: e.stock,
            precio: e.precio,
            costo: e.costo,
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
      statusSincronizacion: const Value('sincronizado'),
    );
    await db.into(db.productos).insertOnConflictUpdate(companion);
  }

  Future<void> actualizarSincronizacion(ProductosCompanion producto) async {
    await db
        .update(db.productos)
        .replace(
          producto.copyWith(statusSincronizacion: Value('sincronizado')),
        );
  }
}
