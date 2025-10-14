// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductosTable extends Productos
    with TableInfo<$ProductosTable, ProductoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
    'uuid',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
    'sku',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _stockMeta = const VerificationMeta('stock');
  @override
  late final GeneratedColumn<int> stock = GeneratedColumn<int>(
    'stock',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _precioMeta = const VerificationMeta('precio');
  @override
  late final GeneratedColumn<double> precio = GeneratedColumn<double>(
    'precio',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _costoMeta = const VerificationMeta('costo');
  @override
  late final GeneratedColumn<double> costo = GeneratedColumn<double>(
    'costo',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('activo'),
  );
  static const VerificationMeta _registroFechaMeta = const VerificationMeta(
    'registroFecha',
  );
  @override
  late final GeneratedColumn<DateTime> registroFecha =
      GeneratedColumn<DateTime>(
        'registro_fecha',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _actualizacionFechaMeta =
      const VerificationMeta('actualizacionFecha');
  @override
  late final GeneratedColumn<DateTime> actualizacionFecha =
      GeneratedColumn<DateTime>(
        'actualizacion_fecha',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _statusSincronizacionMeta =
      const VerificationMeta('statusSincronizacion');
  @override
  late final GeneratedColumn<String> statusSincronizacion =
      GeneratedColumn<String>(
        'status_sincronizacion',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('creacion_pendiente'),
      );
  @override
  List<GeneratedColumn> get $columns => [
    uuid,
    sku,
    nombre,
    stock,
    precio,
    costo,
    status,
    registroFecha,
    actualizacionFecha,
    statusSincronizacion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'productos';
  @override
  VerificationContext validateIntegrity(
    Insertable<ProductoEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('uuid')) {
      context.handle(
        _uuidMeta,
        uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta),
      );
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('sku')) {
      context.handle(
        _skuMeta,
        sku.isAcceptableOrUnknown(data['sku']!, _skuMeta),
      );
    } else if (isInserting) {
      context.missing(_skuMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('stock')) {
      context.handle(
        _stockMeta,
        stock.isAcceptableOrUnknown(data['stock']!, _stockMeta),
      );
    } else if (isInserting) {
      context.missing(_stockMeta);
    }
    if (data.containsKey('precio')) {
      context.handle(
        _precioMeta,
        precio.isAcceptableOrUnknown(data['precio']!, _precioMeta),
      );
    } else if (isInserting) {
      context.missing(_precioMeta);
    }
    if (data.containsKey('costo')) {
      context.handle(
        _costoMeta,
        costo.isAcceptableOrUnknown(data['costo']!, _costoMeta),
      );
    } else if (isInserting) {
      context.missing(_costoMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('registro_fecha')) {
      context.handle(
        _registroFechaMeta,
        registroFecha.isAcceptableOrUnknown(
          data['registro_fecha']!,
          _registroFechaMeta,
        ),
      );
    }
    if (data.containsKey('actualizacion_fecha')) {
      context.handle(
        _actualizacionFechaMeta,
        actualizacionFecha.isAcceptableOrUnknown(
          data['actualizacion_fecha']!,
          _actualizacionFechaMeta,
        ),
      );
    }
    if (data.containsKey('status_sincronizacion')) {
      context.handle(
        _statusSincronizacionMeta,
        statusSincronizacion.isAcceptableOrUnknown(
          data['status_sincronizacion']!,
          _statusSincronizacionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {uuid};
  @override
  ProductoEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductoEntity(
      uuid: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}uuid'],
      )!,
      sku: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}sku'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      stock: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}stock'],
      )!,
      precio: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}precio'],
      )!,
      costo: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}costo'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      registroFecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}registro_fecha'],
      )!,
      actualizacionFecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actualizacion_fecha'],
      ),
      statusSincronizacion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_sincronizacion'],
      )!,
    );
  }

  @override
  $ProductosTable createAlias(String alias) {
    return $ProductosTable(attachedDatabase, alias);
  }
}

class ProductoEntity extends DataClass implements Insertable<ProductoEntity> {
  final String uuid;
  final String sku;
  final String nombre;
  final int stock;
  final double precio;
  final double costo;
  final String status;
  final DateTime registroFecha;
  final DateTime? actualizacionFecha;
  final String statusSincronizacion;
  const ProductoEntity({
    required this.uuid,
    required this.sku,
    required this.nombre,
    required this.stock,
    required this.precio,
    required this.costo,
    required this.status,
    required this.registroFecha,
    this.actualizacionFecha,
    required this.statusSincronizacion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['uuid'] = Variable<String>(uuid);
    map['sku'] = Variable<String>(sku);
    map['nombre'] = Variable<String>(nombre);
    map['stock'] = Variable<int>(stock);
    map['precio'] = Variable<double>(precio);
    map['costo'] = Variable<double>(costo);
    map['status'] = Variable<String>(status);
    map['registro_fecha'] = Variable<DateTime>(registroFecha);
    if (!nullToAbsent || actualizacionFecha != null) {
      map['actualizacion_fecha'] = Variable<DateTime>(actualizacionFecha);
    }
    map['status_sincronizacion'] = Variable<String>(statusSincronizacion);
    return map;
  }

  ProductosCompanion toCompanion(bool nullToAbsent) {
    return ProductosCompanion(
      uuid: Value(uuid),
      sku: Value(sku),
      nombre: Value(nombre),
      stock: Value(stock),
      precio: Value(precio),
      costo: Value(costo),
      status: Value(status),
      registroFecha: Value(registroFecha),
      actualizacionFecha: actualizacionFecha == null && nullToAbsent
          ? const Value.absent()
          : Value(actualizacionFecha),
      statusSincronizacion: Value(statusSincronizacion),
    );
  }

  factory ProductoEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductoEntity(
      uuid: serializer.fromJson<String>(json['uuid']),
      sku: serializer.fromJson<String>(json['sku']),
      nombre: serializer.fromJson<String>(json['nombre']),
      stock: serializer.fromJson<int>(json['stock']),
      precio: serializer.fromJson<double>(json['precio']),
      costo: serializer.fromJson<double>(json['costo']),
      status: serializer.fromJson<String>(json['status']),
      registroFecha: serializer.fromJson<DateTime>(json['registroFecha']),
      actualizacionFecha: serializer.fromJson<DateTime?>(
        json['actualizacionFecha'],
      ),
      statusSincronizacion: serializer.fromJson<String>(
        json['statusSincronizacion'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'uuid': serializer.toJson<String>(uuid),
      'sku': serializer.toJson<String>(sku),
      'nombre': serializer.toJson<String>(nombre),
      'stock': serializer.toJson<int>(stock),
      'precio': serializer.toJson<double>(precio),
      'costo': serializer.toJson<double>(costo),
      'status': serializer.toJson<String>(status),
      'registroFecha': serializer.toJson<DateTime>(registroFecha),
      'actualizacionFecha': serializer.toJson<DateTime?>(actualizacionFecha),
      'statusSincronizacion': serializer.toJson<String>(statusSincronizacion),
    };
  }

  ProductoEntity copyWith({
    String? uuid,
    String? sku,
    String? nombre,
    int? stock,
    double? precio,
    double? costo,
    String? status,
    DateTime? registroFecha,
    Value<DateTime?> actualizacionFecha = const Value.absent(),
    String? statusSincronizacion,
  }) => ProductoEntity(
    uuid: uuid ?? this.uuid,
    sku: sku ?? this.sku,
    nombre: nombre ?? this.nombre,
    stock: stock ?? this.stock,
    precio: precio ?? this.precio,
    costo: costo ?? this.costo,
    status: status ?? this.status,
    registroFecha: registroFecha ?? this.registroFecha,
    actualizacionFecha: actualizacionFecha.present
        ? actualizacionFecha.value
        : this.actualizacionFecha,
    statusSincronizacion: statusSincronizacion ?? this.statusSincronizacion,
  );
  ProductoEntity copyWithCompanion(ProductosCompanion data) {
    return ProductoEntity(
      uuid: data.uuid.present ? data.uuid.value : this.uuid,
      sku: data.sku.present ? data.sku.value : this.sku,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      stock: data.stock.present ? data.stock.value : this.stock,
      precio: data.precio.present ? data.precio.value : this.precio,
      costo: data.costo.present ? data.costo.value : this.costo,
      status: data.status.present ? data.status.value : this.status,
      registroFecha: data.registroFecha.present
          ? data.registroFecha.value
          : this.registroFecha,
      actualizacionFecha: data.actualizacionFecha.present
          ? data.actualizacionFecha.value
          : this.actualizacionFecha,
      statusSincronizacion: data.statusSincronizacion.present
          ? data.statusSincronizacion.value
          : this.statusSincronizacion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductoEntity(')
          ..write('uuid: $uuid, ')
          ..write('sku: $sku, ')
          ..write('nombre: $nombre, ')
          ..write('stock: $stock, ')
          ..write('precio: $precio, ')
          ..write('costo: $costo, ')
          ..write('status: $status, ')
          ..write('registroFecha: $registroFecha, ')
          ..write('actualizacionFecha: $actualizacionFecha, ')
          ..write('statusSincronizacion: $statusSincronizacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    uuid,
    sku,
    nombre,
    stock,
    precio,
    costo,
    status,
    registroFecha,
    actualizacionFecha,
    statusSincronizacion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductoEntity &&
          other.uuid == this.uuid &&
          other.sku == this.sku &&
          other.nombre == this.nombre &&
          other.stock == this.stock &&
          other.precio == this.precio &&
          other.costo == this.costo &&
          other.status == this.status &&
          other.registroFecha == this.registroFecha &&
          other.actualizacionFecha == this.actualizacionFecha &&
          other.statusSincronizacion == this.statusSincronizacion);
}

class ProductosCompanion extends UpdateCompanion<ProductoEntity> {
  final Value<String> uuid;
  final Value<String> sku;
  final Value<String> nombre;
  final Value<int> stock;
  final Value<double> precio;
  final Value<double> costo;
  final Value<String> status;
  final Value<DateTime> registroFecha;
  final Value<DateTime?> actualizacionFecha;
  final Value<String> statusSincronizacion;
  final Value<int> rowid;
  const ProductosCompanion({
    this.uuid = const Value.absent(),
    this.sku = const Value.absent(),
    this.nombre = const Value.absent(),
    this.stock = const Value.absent(),
    this.precio = const Value.absent(),
    this.costo = const Value.absent(),
    this.status = const Value.absent(),
    this.registroFecha = const Value.absent(),
    this.actualizacionFecha = const Value.absent(),
    this.statusSincronizacion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductosCompanion.insert({
    required String uuid,
    required String sku,
    required String nombre,
    required int stock,
    required double precio,
    required double costo,
    this.status = const Value.absent(),
    this.registroFecha = const Value.absent(),
    this.actualizacionFecha = const Value.absent(),
    this.statusSincronizacion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : uuid = Value(uuid),
       sku = Value(sku),
       nombre = Value(nombre),
       stock = Value(stock),
       precio = Value(precio),
       costo = Value(costo);
  static Insertable<ProductoEntity> custom({
    Expression<String>? uuid,
    Expression<String>? sku,
    Expression<String>? nombre,
    Expression<int>? stock,
    Expression<double>? precio,
    Expression<double>? costo,
    Expression<String>? status,
    Expression<DateTime>? registroFecha,
    Expression<DateTime>? actualizacionFecha,
    Expression<String>? statusSincronizacion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (uuid != null) 'uuid': uuid,
      if (sku != null) 'sku': sku,
      if (nombre != null) 'nombre': nombre,
      if (stock != null) 'stock': stock,
      if (precio != null) 'precio': precio,
      if (costo != null) 'costo': costo,
      if (status != null) 'status': status,
      if (registroFecha != null) 'registro_fecha': registroFecha,
      if (actualizacionFecha != null) 'actualizacion_fecha': actualizacionFecha,
      if (statusSincronizacion != null)
        'status_sincronizacion': statusSincronizacion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductosCompanion copyWith({
    Value<String>? uuid,
    Value<String>? sku,
    Value<String>? nombre,
    Value<int>? stock,
    Value<double>? precio,
    Value<double>? costo,
    Value<String>? status,
    Value<DateTime>? registroFecha,
    Value<DateTime?>? actualizacionFecha,
    Value<String>? statusSincronizacion,
    Value<int>? rowid,
  }) {
    return ProductosCompanion(
      uuid: uuid ?? this.uuid,
      sku: sku ?? this.sku,
      nombre: nombre ?? this.nombre,
      stock: stock ?? this.stock,
      precio: precio ?? this.precio,
      costo: costo ?? this.costo,
      status: status ?? this.status,
      registroFecha: registroFecha ?? this.registroFecha,
      actualizacionFecha: actualizacionFecha ?? this.actualizacionFecha,
      statusSincronizacion: statusSincronizacion ?? this.statusSincronizacion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (stock.present) {
      map['stock'] = Variable<int>(stock.value);
    }
    if (precio.present) {
      map['precio'] = Variable<double>(precio.value);
    }
    if (costo.present) {
      map['costo'] = Variable<double>(costo.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (registroFecha.present) {
      map['registro_fecha'] = Variable<DateTime>(registroFecha.value);
    }
    if (actualizacionFecha.present) {
      map['actualizacion_fecha'] = Variable<DateTime>(actualizacionFecha.value);
    }
    if (statusSincronizacion.present) {
      map['status_sincronizacion'] = Variable<String>(
        statusSincronizacion.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductosCompanion(')
          ..write('uuid: $uuid, ')
          ..write('sku: $sku, ')
          ..write('nombre: $nombre, ')
          ..write('stock: $stock, ')
          ..write('precio: $precio, ')
          ..write('costo: $costo, ')
          ..write('status: $status, ')
          ..write('registroFecha: $registroFecha, ')
          ..write('actualizacionFecha: $actualizacionFecha, ')
          ..write('statusSincronizacion: $statusSincronizacion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $InventarioMovimientosTable extends InventarioMovimientos
    with TableInfo<$InventarioMovimientosTable, InventarioMovimientoEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $InventarioMovimientosTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _inventarioMovimientoIdMeta =
      const VerificationMeta('inventarioMovimientoId');
  @override
  late final GeneratedColumn<String> inventarioMovimientoId =
      GeneratedColumn<String>(
        'inventario_movimiento_id',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _productoIdMeta = const VerificationMeta(
    'productoId',
  );
  @override
  late final GeneratedColumn<String> productoId = GeneratedColumn<String>(
    'producto_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ventaIdMeta = const VerificationMeta(
    'ventaId',
  );
  @override
  late final GeneratedColumn<String> ventaId = GeneratedColumn<String>(
    'venta_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _cantidadMeta = const VerificationMeta(
    'cantidad',
  );
  @override
  late final GeneratedColumn<int> cantidad = GeneratedColumn<int>(
    'cantidad',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descripcionMeta = const VerificationMeta(
    'descripcion',
  );
  @override
  late final GeneratedColumn<String> descripcion = GeneratedColumn<String>(
    'descripcion',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tipoMeta = const VerificationMeta('tipo');
  @override
  late final GeneratedColumn<String> tipo = GeneratedColumn<String>(
    'tipo',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _registroFechaMeta = const VerificationMeta(
    'registroFecha',
  );
  @override
  late final GeneratedColumn<DateTime> registroFecha =
      GeneratedColumn<DateTime>(
        'registro_fecha',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _statusSincronizacionMeta =
      const VerificationMeta('statusSincronizacion');
  @override
  late final GeneratedColumn<String> statusSincronizacion =
      GeneratedColumn<String>(
        'status_sincronizacion',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('creacion_pendiente'),
      );
  @override
  List<GeneratedColumn> get $columns => [
    inventarioMovimientoId,
    productoId,
    ventaId,
    cantidad,
    descripcion,
    tipo,
    registroFecha,
    statusSincronizacion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'inventario_movimientos';
  @override
  VerificationContext validateIntegrity(
    Insertable<InventarioMovimientoEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('inventario_movimiento_id')) {
      context.handle(
        _inventarioMovimientoIdMeta,
        inventarioMovimientoId.isAcceptableOrUnknown(
          data['inventario_movimiento_id']!,
          _inventarioMovimientoIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inventarioMovimientoIdMeta);
    }
    if (data.containsKey('producto_id')) {
      context.handle(
        _productoIdMeta,
        productoId.isAcceptableOrUnknown(data['producto_id']!, _productoIdMeta),
      );
    } else if (isInserting) {
      context.missing(_productoIdMeta);
    }
    if (data.containsKey('venta_id')) {
      context.handle(
        _ventaIdMeta,
        ventaId.isAcceptableOrUnknown(data['venta_id']!, _ventaIdMeta),
      );
    }
    if (data.containsKey('cantidad')) {
      context.handle(
        _cantidadMeta,
        cantidad.isAcceptableOrUnknown(data['cantidad']!, _cantidadMeta),
      );
    } else if (isInserting) {
      context.missing(_cantidadMeta);
    }
    if (data.containsKey('descripcion')) {
      context.handle(
        _descripcionMeta,
        descripcion.isAcceptableOrUnknown(
          data['descripcion']!,
          _descripcionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descripcionMeta);
    }
    if (data.containsKey('tipo')) {
      context.handle(
        _tipoMeta,
        tipo.isAcceptableOrUnknown(data['tipo']!, _tipoMeta),
      );
    } else if (isInserting) {
      context.missing(_tipoMeta);
    }
    if (data.containsKey('registro_fecha')) {
      context.handle(
        _registroFechaMeta,
        registroFecha.isAcceptableOrUnknown(
          data['registro_fecha']!,
          _registroFechaMeta,
        ),
      );
    }
    if (data.containsKey('status_sincronizacion')) {
      context.handle(
        _statusSincronizacionMeta,
        statusSincronizacion.isAcceptableOrUnknown(
          data['status_sincronizacion']!,
          _statusSincronizacionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {inventarioMovimientoId};
  @override
  InventarioMovimientoEntity map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return InventarioMovimientoEntity(
      inventarioMovimientoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inventario_movimiento_id'],
      )!,
      productoId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}producto_id'],
      )!,
      ventaId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}venta_id'],
      ),
      cantidad: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}cantidad'],
      )!,
      descripcion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}descripcion'],
      )!,
      tipo: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tipo'],
      )!,
      registroFecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}registro_fecha'],
      )!,
      statusSincronizacion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_sincronizacion'],
      )!,
    );
  }

  @override
  $InventarioMovimientosTable createAlias(String alias) {
    return $InventarioMovimientosTable(attachedDatabase, alias);
  }
}

class InventarioMovimientoEntity extends DataClass
    implements Insertable<InventarioMovimientoEntity> {
  final String inventarioMovimientoId;
  final String productoId;
  final String? ventaId;
  final int cantidad;
  final String descripcion;
  final String tipo;
  final DateTime registroFecha;
  final String statusSincronizacion;
  const InventarioMovimientoEntity({
    required this.inventarioMovimientoId,
    required this.productoId,
    this.ventaId,
    required this.cantidad,
    required this.descripcion,
    required this.tipo,
    required this.registroFecha,
    required this.statusSincronizacion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['inventario_movimiento_id'] = Variable<String>(inventarioMovimientoId);
    map['producto_id'] = Variable<String>(productoId);
    if (!nullToAbsent || ventaId != null) {
      map['venta_id'] = Variable<String>(ventaId);
    }
    map['cantidad'] = Variable<int>(cantidad);
    map['descripcion'] = Variable<String>(descripcion);
    map['tipo'] = Variable<String>(tipo);
    map['registro_fecha'] = Variable<DateTime>(registroFecha);
    map['status_sincronizacion'] = Variable<String>(statusSincronizacion);
    return map;
  }

  InventarioMovimientosCompanion toCompanion(bool nullToAbsent) {
    return InventarioMovimientosCompanion(
      inventarioMovimientoId: Value(inventarioMovimientoId),
      productoId: Value(productoId),
      ventaId: ventaId == null && nullToAbsent
          ? const Value.absent()
          : Value(ventaId),
      cantidad: Value(cantidad),
      descripcion: Value(descripcion),
      tipo: Value(tipo),
      registroFecha: Value(registroFecha),
      statusSincronizacion: Value(statusSincronizacion),
    );
  }

  factory InventarioMovimientoEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return InventarioMovimientoEntity(
      inventarioMovimientoId: serializer.fromJson<String>(
        json['inventarioMovimientoId'],
      ),
      productoId: serializer.fromJson<String>(json['productoId']),
      ventaId: serializer.fromJson<String?>(json['ventaId']),
      cantidad: serializer.fromJson<int>(json['cantidad']),
      descripcion: serializer.fromJson<String>(json['descripcion']),
      tipo: serializer.fromJson<String>(json['tipo']),
      registroFecha: serializer.fromJson<DateTime>(json['registroFecha']),
      statusSincronizacion: serializer.fromJson<String>(
        json['statusSincronizacion'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'inventarioMovimientoId': serializer.toJson<String>(
        inventarioMovimientoId,
      ),
      'productoId': serializer.toJson<String>(productoId),
      'ventaId': serializer.toJson<String?>(ventaId),
      'cantidad': serializer.toJson<int>(cantidad),
      'descripcion': serializer.toJson<String>(descripcion),
      'tipo': serializer.toJson<String>(tipo),
      'registroFecha': serializer.toJson<DateTime>(registroFecha),
      'statusSincronizacion': serializer.toJson<String>(statusSincronizacion),
    };
  }

  InventarioMovimientoEntity copyWith({
    String? inventarioMovimientoId,
    String? productoId,
    Value<String?> ventaId = const Value.absent(),
    int? cantidad,
    String? descripcion,
    String? tipo,
    DateTime? registroFecha,
    String? statusSincronizacion,
  }) => InventarioMovimientoEntity(
    inventarioMovimientoId:
        inventarioMovimientoId ?? this.inventarioMovimientoId,
    productoId: productoId ?? this.productoId,
    ventaId: ventaId.present ? ventaId.value : this.ventaId,
    cantidad: cantidad ?? this.cantidad,
    descripcion: descripcion ?? this.descripcion,
    tipo: tipo ?? this.tipo,
    registroFecha: registroFecha ?? this.registroFecha,
    statusSincronizacion: statusSincronizacion ?? this.statusSincronizacion,
  );
  InventarioMovimientoEntity copyWithCompanion(
    InventarioMovimientosCompanion data,
  ) {
    return InventarioMovimientoEntity(
      inventarioMovimientoId: data.inventarioMovimientoId.present
          ? data.inventarioMovimientoId.value
          : this.inventarioMovimientoId,
      productoId: data.productoId.present
          ? data.productoId.value
          : this.productoId,
      ventaId: data.ventaId.present ? data.ventaId.value : this.ventaId,
      cantidad: data.cantidad.present ? data.cantidad.value : this.cantidad,
      descripcion: data.descripcion.present
          ? data.descripcion.value
          : this.descripcion,
      tipo: data.tipo.present ? data.tipo.value : this.tipo,
      registroFecha: data.registroFecha.present
          ? data.registroFecha.value
          : this.registroFecha,
      statusSincronizacion: data.statusSincronizacion.present
          ? data.statusSincronizacion.value
          : this.statusSincronizacion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('InventarioMovimientoEntity(')
          ..write('inventarioMovimientoId: $inventarioMovimientoId, ')
          ..write('productoId: $productoId, ')
          ..write('ventaId: $ventaId, ')
          ..write('cantidad: $cantidad, ')
          ..write('descripcion: $descripcion, ')
          ..write('tipo: $tipo, ')
          ..write('registroFecha: $registroFecha, ')
          ..write('statusSincronizacion: $statusSincronizacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    inventarioMovimientoId,
    productoId,
    ventaId,
    cantidad,
    descripcion,
    tipo,
    registroFecha,
    statusSincronizacion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is InventarioMovimientoEntity &&
          other.inventarioMovimientoId == this.inventarioMovimientoId &&
          other.productoId == this.productoId &&
          other.ventaId == this.ventaId &&
          other.cantidad == this.cantidad &&
          other.descripcion == this.descripcion &&
          other.tipo == this.tipo &&
          other.registroFecha == this.registroFecha &&
          other.statusSincronizacion == this.statusSincronizacion);
}

class InventarioMovimientosCompanion
    extends UpdateCompanion<InventarioMovimientoEntity> {
  final Value<String> inventarioMovimientoId;
  final Value<String> productoId;
  final Value<String?> ventaId;
  final Value<int> cantidad;
  final Value<String> descripcion;
  final Value<String> tipo;
  final Value<DateTime> registroFecha;
  final Value<String> statusSincronizacion;
  final Value<int> rowid;
  const InventarioMovimientosCompanion({
    this.inventarioMovimientoId = const Value.absent(),
    this.productoId = const Value.absent(),
    this.ventaId = const Value.absent(),
    this.cantidad = const Value.absent(),
    this.descripcion = const Value.absent(),
    this.tipo = const Value.absent(),
    this.registroFecha = const Value.absent(),
    this.statusSincronizacion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  InventarioMovimientosCompanion.insert({
    required String inventarioMovimientoId,
    required String productoId,
    this.ventaId = const Value.absent(),
    required int cantidad,
    required String descripcion,
    required String tipo,
    this.registroFecha = const Value.absent(),
    this.statusSincronizacion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : inventarioMovimientoId = Value(inventarioMovimientoId),
       productoId = Value(productoId),
       cantidad = Value(cantidad),
       descripcion = Value(descripcion),
       tipo = Value(tipo);
  static Insertable<InventarioMovimientoEntity> custom({
    Expression<String>? inventarioMovimientoId,
    Expression<String>? productoId,
    Expression<String>? ventaId,
    Expression<int>? cantidad,
    Expression<String>? descripcion,
    Expression<String>? tipo,
    Expression<DateTime>? registroFecha,
    Expression<String>? statusSincronizacion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (inventarioMovimientoId != null)
        'inventario_movimiento_id': inventarioMovimientoId,
      if (productoId != null) 'producto_id': productoId,
      if (ventaId != null) 'venta_id': ventaId,
      if (cantidad != null) 'cantidad': cantidad,
      if (descripcion != null) 'descripcion': descripcion,
      if (tipo != null) 'tipo': tipo,
      if (registroFecha != null) 'registro_fecha': registroFecha,
      if (statusSincronizacion != null)
        'status_sincronizacion': statusSincronizacion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  InventarioMovimientosCompanion copyWith({
    Value<String>? inventarioMovimientoId,
    Value<String>? productoId,
    Value<String?>? ventaId,
    Value<int>? cantidad,
    Value<String>? descripcion,
    Value<String>? tipo,
    Value<DateTime>? registroFecha,
    Value<String>? statusSincronizacion,
    Value<int>? rowid,
  }) {
    return InventarioMovimientosCompanion(
      inventarioMovimientoId:
          inventarioMovimientoId ?? this.inventarioMovimientoId,
      productoId: productoId ?? this.productoId,
      ventaId: ventaId ?? this.ventaId,
      cantidad: cantidad ?? this.cantidad,
      descripcion: descripcion ?? this.descripcion,
      tipo: tipo ?? this.tipo,
      registroFecha: registroFecha ?? this.registroFecha,
      statusSincronizacion: statusSincronizacion ?? this.statusSincronizacion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (inventarioMovimientoId.present) {
      map['inventario_movimiento_id'] = Variable<String>(
        inventarioMovimientoId.value,
      );
    }
    if (productoId.present) {
      map['producto_id'] = Variable<String>(productoId.value);
    }
    if (ventaId.present) {
      map['venta_id'] = Variable<String>(ventaId.value);
    }
    if (cantidad.present) {
      map['cantidad'] = Variable<int>(cantidad.value);
    }
    if (descripcion.present) {
      map['descripcion'] = Variable<String>(descripcion.value);
    }
    if (tipo.present) {
      map['tipo'] = Variable<String>(tipo.value);
    }
    if (registroFecha.present) {
      map['registro_fecha'] = Variable<DateTime>(registroFecha.value);
    }
    if (statusSincronizacion.present) {
      map['status_sincronizacion'] = Variable<String>(
        statusSincronizacion.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('InventarioMovimientosCompanion(')
          ..write('inventarioMovimientoId: $inventarioMovimientoId, ')
          ..write('productoId: $productoId, ')
          ..write('ventaId: $ventaId, ')
          ..write('cantidad: $cantidad, ')
          ..write('descripcion: $descripcion, ')
          ..write('tipo: $tipo, ')
          ..write('registroFecha: $registroFecha, ')
          ..write('statusSincronizacion: $statusSincronizacion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ClientesTable extends Clientes
    with TableInfo<$ClientesTable, ClienteEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ClientesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _clienteIdMeta = const VerificationMeta(
    'clienteId',
  );
  @override
  late final GeneratedColumn<String> clienteId = GeneratedColumn<String>(
    'cliente_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _telefonoMeta = const VerificationMeta(
    'telefono',
  );
  @override
  late final GeneratedColumn<String> telefono = GeneratedColumn<String>(
    'telefono',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nombreMeta = const VerificationMeta('nombre');
  @override
  late final GeneratedColumn<String> nombre = GeneratedColumn<String>(
    'nombre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
    'status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('activo'),
  );
  static const VerificationMeta _registroFechaMeta = const VerificationMeta(
    'registroFecha',
  );
  @override
  late final GeneratedColumn<DateTime> registroFecha =
      GeneratedColumn<DateTime>(
        'registro_fecha',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _actualizacionFechaMeta =
      const VerificationMeta('actualizacionFecha');
  @override
  late final GeneratedColumn<DateTime> actualizacionFecha =
      GeneratedColumn<DateTime>(
        'actualizacion_fecha',
        aliasedName,
        true,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _statusSincronizacionMeta =
      const VerificationMeta('statusSincronizacion');
  @override
  late final GeneratedColumn<String> statusSincronizacion =
      GeneratedColumn<String>(
        'status_sincronizacion',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('creacion_pendiente'),
      );
  @override
  List<GeneratedColumn> get $columns => [
    clienteId,
    telefono,
    nombre,
    status,
    registroFecha,
    actualizacionFecha,
    statusSincronizacion,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'clientes';
  @override
  VerificationContext validateIntegrity(
    Insertable<ClienteEntity> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('cliente_id')) {
      context.handle(
        _clienteIdMeta,
        clienteId.isAcceptableOrUnknown(data['cliente_id']!, _clienteIdMeta),
      );
    } else if (isInserting) {
      context.missing(_clienteIdMeta);
    }
    if (data.containsKey('telefono')) {
      context.handle(
        _telefonoMeta,
        telefono.isAcceptableOrUnknown(data['telefono']!, _telefonoMeta),
      );
    } else if (isInserting) {
      context.missing(_telefonoMeta);
    }
    if (data.containsKey('nombre')) {
      context.handle(
        _nombreMeta,
        nombre.isAcceptableOrUnknown(data['nombre']!, _nombreMeta),
      );
    } else if (isInserting) {
      context.missing(_nombreMeta);
    }
    if (data.containsKey('status')) {
      context.handle(
        _statusMeta,
        status.isAcceptableOrUnknown(data['status']!, _statusMeta),
      );
    }
    if (data.containsKey('registro_fecha')) {
      context.handle(
        _registroFechaMeta,
        registroFecha.isAcceptableOrUnknown(
          data['registro_fecha']!,
          _registroFechaMeta,
        ),
      );
    }
    if (data.containsKey('actualizacion_fecha')) {
      context.handle(
        _actualizacionFechaMeta,
        actualizacionFecha.isAcceptableOrUnknown(
          data['actualizacion_fecha']!,
          _actualizacionFechaMeta,
        ),
      );
    }
    if (data.containsKey('status_sincronizacion')) {
      context.handle(
        _statusSincronizacionMeta,
        statusSincronizacion.isAcceptableOrUnknown(
          data['status_sincronizacion']!,
          _statusSincronizacionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {clienteId};
  @override
  ClienteEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ClienteEntity(
      clienteId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cliente_id'],
      )!,
      telefono: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}telefono'],
      )!,
      nombre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}nombre'],
      )!,
      status: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status'],
      )!,
      registroFecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}registro_fecha'],
      )!,
      actualizacionFecha: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}actualizacion_fecha'],
      ),
      statusSincronizacion: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}status_sincronizacion'],
      )!,
    );
  }

  @override
  $ClientesTable createAlias(String alias) {
    return $ClientesTable(attachedDatabase, alias);
  }
}

class ClienteEntity extends DataClass implements Insertable<ClienteEntity> {
  final String clienteId;
  final String telefono;
  final String nombre;
  final String status;
  final DateTime registroFecha;
  final DateTime? actualizacionFecha;
  final String statusSincronizacion;
  const ClienteEntity({
    required this.clienteId,
    required this.telefono,
    required this.nombre,
    required this.status,
    required this.registroFecha,
    this.actualizacionFecha,
    required this.statusSincronizacion,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['cliente_id'] = Variable<String>(clienteId);
    map['telefono'] = Variable<String>(telefono);
    map['nombre'] = Variable<String>(nombre);
    map['status'] = Variable<String>(status);
    map['registro_fecha'] = Variable<DateTime>(registroFecha);
    if (!nullToAbsent || actualizacionFecha != null) {
      map['actualizacion_fecha'] = Variable<DateTime>(actualizacionFecha);
    }
    map['status_sincronizacion'] = Variable<String>(statusSincronizacion);
    return map;
  }

  ClientesCompanion toCompanion(bool nullToAbsent) {
    return ClientesCompanion(
      clienteId: Value(clienteId),
      telefono: Value(telefono),
      nombre: Value(nombre),
      status: Value(status),
      registroFecha: Value(registroFecha),
      actualizacionFecha: actualizacionFecha == null && nullToAbsent
          ? const Value.absent()
          : Value(actualizacionFecha),
      statusSincronizacion: Value(statusSincronizacion),
    );
  }

  factory ClienteEntity.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ClienteEntity(
      clienteId: serializer.fromJson<String>(json['clienteId']),
      telefono: serializer.fromJson<String>(json['telefono']),
      nombre: serializer.fromJson<String>(json['nombre']),
      status: serializer.fromJson<String>(json['status']),
      registroFecha: serializer.fromJson<DateTime>(json['registroFecha']),
      actualizacionFecha: serializer.fromJson<DateTime?>(
        json['actualizacionFecha'],
      ),
      statusSincronizacion: serializer.fromJson<String>(
        json['statusSincronizacion'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'clienteId': serializer.toJson<String>(clienteId),
      'telefono': serializer.toJson<String>(telefono),
      'nombre': serializer.toJson<String>(nombre),
      'status': serializer.toJson<String>(status),
      'registroFecha': serializer.toJson<DateTime>(registroFecha),
      'actualizacionFecha': serializer.toJson<DateTime?>(actualizacionFecha),
      'statusSincronizacion': serializer.toJson<String>(statusSincronizacion),
    };
  }

  ClienteEntity copyWith({
    String? clienteId,
    String? telefono,
    String? nombre,
    String? status,
    DateTime? registroFecha,
    Value<DateTime?> actualizacionFecha = const Value.absent(),
    String? statusSincronizacion,
  }) => ClienteEntity(
    clienteId: clienteId ?? this.clienteId,
    telefono: telefono ?? this.telefono,
    nombre: nombre ?? this.nombre,
    status: status ?? this.status,
    registroFecha: registroFecha ?? this.registroFecha,
    actualizacionFecha: actualizacionFecha.present
        ? actualizacionFecha.value
        : this.actualizacionFecha,
    statusSincronizacion: statusSincronizacion ?? this.statusSincronizacion,
  );
  ClienteEntity copyWithCompanion(ClientesCompanion data) {
    return ClienteEntity(
      clienteId: data.clienteId.present ? data.clienteId.value : this.clienteId,
      telefono: data.telefono.present ? data.telefono.value : this.telefono,
      nombre: data.nombre.present ? data.nombre.value : this.nombre,
      status: data.status.present ? data.status.value : this.status,
      registroFecha: data.registroFecha.present
          ? data.registroFecha.value
          : this.registroFecha,
      actualizacionFecha: data.actualizacionFecha.present
          ? data.actualizacionFecha.value
          : this.actualizacionFecha,
      statusSincronizacion: data.statusSincronizacion.present
          ? data.statusSincronizacion.value
          : this.statusSincronizacion,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ClienteEntity(')
          ..write('clienteId: $clienteId, ')
          ..write('telefono: $telefono, ')
          ..write('nombre: $nombre, ')
          ..write('status: $status, ')
          ..write('registroFecha: $registroFecha, ')
          ..write('actualizacionFecha: $actualizacionFecha, ')
          ..write('statusSincronizacion: $statusSincronizacion')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    clienteId,
    telefono,
    nombre,
    status,
    registroFecha,
    actualizacionFecha,
    statusSincronizacion,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ClienteEntity &&
          other.clienteId == this.clienteId &&
          other.telefono == this.telefono &&
          other.nombre == this.nombre &&
          other.status == this.status &&
          other.registroFecha == this.registroFecha &&
          other.actualizacionFecha == this.actualizacionFecha &&
          other.statusSincronizacion == this.statusSincronizacion);
}

class ClientesCompanion extends UpdateCompanion<ClienteEntity> {
  final Value<String> clienteId;
  final Value<String> telefono;
  final Value<String> nombre;
  final Value<String> status;
  final Value<DateTime> registroFecha;
  final Value<DateTime?> actualizacionFecha;
  final Value<String> statusSincronizacion;
  final Value<int> rowid;
  const ClientesCompanion({
    this.clienteId = const Value.absent(),
    this.telefono = const Value.absent(),
    this.nombre = const Value.absent(),
    this.status = const Value.absent(),
    this.registroFecha = const Value.absent(),
    this.actualizacionFecha = const Value.absent(),
    this.statusSincronizacion = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ClientesCompanion.insert({
    required String clienteId,
    required String telefono,
    required String nombre,
    this.status = const Value.absent(),
    this.registroFecha = const Value.absent(),
    this.actualizacionFecha = const Value.absent(),
    this.statusSincronizacion = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : clienteId = Value(clienteId),
       telefono = Value(telefono),
       nombre = Value(nombre);
  static Insertable<ClienteEntity> custom({
    Expression<String>? clienteId,
    Expression<String>? telefono,
    Expression<String>? nombre,
    Expression<String>? status,
    Expression<DateTime>? registroFecha,
    Expression<DateTime>? actualizacionFecha,
    Expression<String>? statusSincronizacion,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (clienteId != null) 'cliente_id': clienteId,
      if (telefono != null) 'telefono': telefono,
      if (nombre != null) 'nombre': nombre,
      if (status != null) 'status': status,
      if (registroFecha != null) 'registro_fecha': registroFecha,
      if (actualizacionFecha != null) 'actualizacion_fecha': actualizacionFecha,
      if (statusSincronizacion != null)
        'status_sincronizacion': statusSincronizacion,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ClientesCompanion copyWith({
    Value<String>? clienteId,
    Value<String>? telefono,
    Value<String>? nombre,
    Value<String>? status,
    Value<DateTime>? registroFecha,
    Value<DateTime?>? actualizacionFecha,
    Value<String>? statusSincronizacion,
    Value<int>? rowid,
  }) {
    return ClientesCompanion(
      clienteId: clienteId ?? this.clienteId,
      telefono: telefono ?? this.telefono,
      nombre: nombre ?? this.nombre,
      status: status ?? this.status,
      registroFecha: registroFecha ?? this.registroFecha,
      actualizacionFecha: actualizacionFecha ?? this.actualizacionFecha,
      statusSincronizacion: statusSincronizacion ?? this.statusSincronizacion,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (clienteId.present) {
      map['cliente_id'] = Variable<String>(clienteId.value);
    }
    if (telefono.present) {
      map['telefono'] = Variable<String>(telefono.value);
    }
    if (nombre.present) {
      map['nombre'] = Variable<String>(nombre.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (registroFecha.present) {
      map['registro_fecha'] = Variable<DateTime>(registroFecha.value);
    }
    if (actualizacionFecha.present) {
      map['actualizacion_fecha'] = Variable<DateTime>(actualizacionFecha.value);
    }
    if (statusSincronizacion.present) {
      map['status_sincronizacion'] = Variable<String>(
        statusSincronizacion.value,
      );
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ClientesCompanion(')
          ..write('clienteId: $clienteId, ')
          ..write('telefono: $telefono, ')
          ..write('nombre: $nombre, ')
          ..write('status: $status, ')
          ..write('registroFecha: $registroFecha, ')
          ..write('actualizacionFecha: $actualizacionFecha, ')
          ..write('statusSincronizacion: $statusSincronizacion, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductosTable productos = $ProductosTable(this);
  late final $InventarioMovimientosTable inventarioMovimientos =
      $InventarioMovimientosTable(this);
  late final $ClientesTable clientes = $ClientesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    productos,
    inventarioMovimientos,
    clientes,
  ];
}

typedef $$ProductosTableCreateCompanionBuilder =
    ProductosCompanion Function({
      required String uuid,
      required String sku,
      required String nombre,
      required int stock,
      required double precio,
      required double costo,
      Value<String> status,
      Value<DateTime> registroFecha,
      Value<DateTime?> actualizacionFecha,
      Value<String> statusSincronizacion,
      Value<int> rowid,
    });
typedef $$ProductosTableUpdateCompanionBuilder =
    ProductosCompanion Function({
      Value<String> uuid,
      Value<String> sku,
      Value<String> nombre,
      Value<int> stock,
      Value<double> precio,
      Value<double> costo,
      Value<String> status,
      Value<DateTime> registroFecha,
      Value<DateTime?> actualizacionFecha,
      Value<String> statusSincronizacion,
      Value<int> rowid,
    });

class $$ProductosTableFilterComposer
    extends Composer<_$AppDatabase, $ProductosTable> {
  $$ProductosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get precio => $composableBuilder(
    column: $table.precio,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get costo => $composableBuilder(
    column: $table.costo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get registroFecha => $composableBuilder(
    column: $table.registroFecha,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualizacionFecha => $composableBuilder(
    column: $table.actualizacionFecha,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusSincronizacion => $composableBuilder(
    column: $table.statusSincronizacion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ProductosTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductosTable> {
  $$ProductosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get uuid => $composableBuilder(
    column: $table.uuid,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sku => $composableBuilder(
    column: $table.sku,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get stock => $composableBuilder(
    column: $table.stock,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get precio => $composableBuilder(
    column: $table.precio,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get costo => $composableBuilder(
    column: $table.costo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get registroFecha => $composableBuilder(
    column: $table.registroFecha,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualizacionFecha => $composableBuilder(
    column: $table.actualizacionFecha,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusSincronizacion => $composableBuilder(
    column: $table.statusSincronizacion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ProductosTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductosTable> {
  $$ProductosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get uuid =>
      $composableBuilder(column: $table.uuid, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<int> get stock =>
      $composableBuilder(column: $table.stock, builder: (column) => column);

  GeneratedColumn<double> get precio =>
      $composableBuilder(column: $table.precio, builder: (column) => column);

  GeneratedColumn<double> get costo =>
      $composableBuilder(column: $table.costo, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get registroFecha => $composableBuilder(
    column: $table.registroFecha,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get actualizacionFecha => $composableBuilder(
    column: $table.actualizacionFecha,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusSincronizacion => $composableBuilder(
    column: $table.statusSincronizacion,
    builder: (column) => column,
  );
}

class $$ProductosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ProductosTable,
          ProductoEntity,
          $$ProductosTableFilterComposer,
          $$ProductosTableOrderingComposer,
          $$ProductosTableAnnotationComposer,
          $$ProductosTableCreateCompanionBuilder,
          $$ProductosTableUpdateCompanionBuilder,
          (
            ProductoEntity,
            BaseReferences<_$AppDatabase, $ProductosTable, ProductoEntity>,
          ),
          ProductoEntity,
          PrefetchHooks Function()
        > {
  $$ProductosTableTableManager(_$AppDatabase db, $ProductosTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductosTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductosTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductosTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> uuid = const Value.absent(),
                Value<String> sku = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<int> stock = const Value.absent(),
                Value<double> precio = const Value.absent(),
                Value<double> costo = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> registroFecha = const Value.absent(),
                Value<DateTime?> actualizacionFecha = const Value.absent(),
                Value<String> statusSincronizacion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductosCompanion(
                uuid: uuid,
                sku: sku,
                nombre: nombre,
                stock: stock,
                precio: precio,
                costo: costo,
                status: status,
                registroFecha: registroFecha,
                actualizacionFecha: actualizacionFecha,
                statusSincronizacion: statusSincronizacion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String uuid,
                required String sku,
                required String nombre,
                required int stock,
                required double precio,
                required double costo,
                Value<String> status = const Value.absent(),
                Value<DateTime> registroFecha = const Value.absent(),
                Value<DateTime?> actualizacionFecha = const Value.absent(),
                Value<String> statusSincronizacion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ProductosCompanion.insert(
                uuid: uuid,
                sku: sku,
                nombre: nombre,
                stock: stock,
                precio: precio,
                costo: costo,
                status: status,
                registroFecha: registroFecha,
                actualizacionFecha: actualizacionFecha,
                statusSincronizacion: statusSincronizacion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ProductosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ProductosTable,
      ProductoEntity,
      $$ProductosTableFilterComposer,
      $$ProductosTableOrderingComposer,
      $$ProductosTableAnnotationComposer,
      $$ProductosTableCreateCompanionBuilder,
      $$ProductosTableUpdateCompanionBuilder,
      (
        ProductoEntity,
        BaseReferences<_$AppDatabase, $ProductosTable, ProductoEntity>,
      ),
      ProductoEntity,
      PrefetchHooks Function()
    >;
typedef $$InventarioMovimientosTableCreateCompanionBuilder =
    InventarioMovimientosCompanion Function({
      required String inventarioMovimientoId,
      required String productoId,
      Value<String?> ventaId,
      required int cantidad,
      required String descripcion,
      required String tipo,
      Value<DateTime> registroFecha,
      Value<String> statusSincronizacion,
      Value<int> rowid,
    });
typedef $$InventarioMovimientosTableUpdateCompanionBuilder =
    InventarioMovimientosCompanion Function({
      Value<String> inventarioMovimientoId,
      Value<String> productoId,
      Value<String?> ventaId,
      Value<int> cantidad,
      Value<String> descripcion,
      Value<String> tipo,
      Value<DateTime> registroFecha,
      Value<String> statusSincronizacion,
      Value<int> rowid,
    });

class $$InventarioMovimientosTableFilterComposer
    extends Composer<_$AppDatabase, $InventarioMovimientosTable> {
  $$InventarioMovimientosTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get inventarioMovimientoId => $composableBuilder(
    column: $table.inventarioMovimientoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get productoId => $composableBuilder(
    column: $table.productoId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ventaId => $composableBuilder(
    column: $table.ventaId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get cantidad => $composableBuilder(
    column: $table.cantidad,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get registroFecha => $composableBuilder(
    column: $table.registroFecha,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusSincronizacion => $composableBuilder(
    column: $table.statusSincronizacion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$InventarioMovimientosTableOrderingComposer
    extends Composer<_$AppDatabase, $InventarioMovimientosTable> {
  $$InventarioMovimientosTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get inventarioMovimientoId => $composableBuilder(
    column: $table.inventarioMovimientoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get productoId => $composableBuilder(
    column: $table.productoId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ventaId => $composableBuilder(
    column: $table.ventaId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get cantidad => $composableBuilder(
    column: $table.cantidad,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get tipo => $composableBuilder(
    column: $table.tipo,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get registroFecha => $composableBuilder(
    column: $table.registroFecha,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusSincronizacion => $composableBuilder(
    column: $table.statusSincronizacion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$InventarioMovimientosTableAnnotationComposer
    extends Composer<_$AppDatabase, $InventarioMovimientosTable> {
  $$InventarioMovimientosTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get inventarioMovimientoId => $composableBuilder(
    column: $table.inventarioMovimientoId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get productoId => $composableBuilder(
    column: $table.productoId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ventaId =>
      $composableBuilder(column: $table.ventaId, builder: (column) => column);

  GeneratedColumn<int> get cantidad =>
      $composableBuilder(column: $table.cantidad, builder: (column) => column);

  GeneratedColumn<String> get descripcion => $composableBuilder(
    column: $table.descripcion,
    builder: (column) => column,
  );

  GeneratedColumn<String> get tipo =>
      $composableBuilder(column: $table.tipo, builder: (column) => column);

  GeneratedColumn<DateTime> get registroFecha => $composableBuilder(
    column: $table.registroFecha,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusSincronizacion => $composableBuilder(
    column: $table.statusSincronizacion,
    builder: (column) => column,
  );
}

class $$InventarioMovimientosTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $InventarioMovimientosTable,
          InventarioMovimientoEntity,
          $$InventarioMovimientosTableFilterComposer,
          $$InventarioMovimientosTableOrderingComposer,
          $$InventarioMovimientosTableAnnotationComposer,
          $$InventarioMovimientosTableCreateCompanionBuilder,
          $$InventarioMovimientosTableUpdateCompanionBuilder,
          (
            InventarioMovimientoEntity,
            BaseReferences<
              _$AppDatabase,
              $InventarioMovimientosTable,
              InventarioMovimientoEntity
            >,
          ),
          InventarioMovimientoEntity,
          PrefetchHooks Function()
        > {
  $$InventarioMovimientosTableTableManager(
    _$AppDatabase db,
    $InventarioMovimientosTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$InventarioMovimientosTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$InventarioMovimientosTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$InventarioMovimientosTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> inventarioMovimientoId = const Value.absent(),
                Value<String> productoId = const Value.absent(),
                Value<String?> ventaId = const Value.absent(),
                Value<int> cantidad = const Value.absent(),
                Value<String> descripcion = const Value.absent(),
                Value<String> tipo = const Value.absent(),
                Value<DateTime> registroFecha = const Value.absent(),
                Value<String> statusSincronizacion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InventarioMovimientosCompanion(
                inventarioMovimientoId: inventarioMovimientoId,
                productoId: productoId,
                ventaId: ventaId,
                cantidad: cantidad,
                descripcion: descripcion,
                tipo: tipo,
                registroFecha: registroFecha,
                statusSincronizacion: statusSincronizacion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String inventarioMovimientoId,
                required String productoId,
                Value<String?> ventaId = const Value.absent(),
                required int cantidad,
                required String descripcion,
                required String tipo,
                Value<DateTime> registroFecha = const Value.absent(),
                Value<String> statusSincronizacion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => InventarioMovimientosCompanion.insert(
                inventarioMovimientoId: inventarioMovimientoId,
                productoId: productoId,
                ventaId: ventaId,
                cantidad: cantidad,
                descripcion: descripcion,
                tipo: tipo,
                registroFecha: registroFecha,
                statusSincronizacion: statusSincronizacion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$InventarioMovimientosTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $InventarioMovimientosTable,
      InventarioMovimientoEntity,
      $$InventarioMovimientosTableFilterComposer,
      $$InventarioMovimientosTableOrderingComposer,
      $$InventarioMovimientosTableAnnotationComposer,
      $$InventarioMovimientosTableCreateCompanionBuilder,
      $$InventarioMovimientosTableUpdateCompanionBuilder,
      (
        InventarioMovimientoEntity,
        BaseReferences<
          _$AppDatabase,
          $InventarioMovimientosTable,
          InventarioMovimientoEntity
        >,
      ),
      InventarioMovimientoEntity,
      PrefetchHooks Function()
    >;
typedef $$ClientesTableCreateCompanionBuilder =
    ClientesCompanion Function({
      required String clienteId,
      required String telefono,
      required String nombre,
      Value<String> status,
      Value<DateTime> registroFecha,
      Value<DateTime?> actualizacionFecha,
      Value<String> statusSincronizacion,
      Value<int> rowid,
    });
typedef $$ClientesTableUpdateCompanionBuilder =
    ClientesCompanion Function({
      Value<String> clienteId,
      Value<String> telefono,
      Value<String> nombre,
      Value<String> status,
      Value<DateTime> registroFecha,
      Value<DateTime?> actualizacionFecha,
      Value<String> statusSincronizacion,
      Value<int> rowid,
    });

class $$ClientesTableFilterComposer
    extends Composer<_$AppDatabase, $ClientesTable> {
  $$ClientesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get clienteId => $composableBuilder(
    column: $table.clienteId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get registroFecha => $composableBuilder(
    column: $table.registroFecha,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get actualizacionFecha => $composableBuilder(
    column: $table.actualizacionFecha,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get statusSincronizacion => $composableBuilder(
    column: $table.statusSincronizacion,
    builder: (column) => ColumnFilters(column),
  );
}

class $$ClientesTableOrderingComposer
    extends Composer<_$AppDatabase, $ClientesTable> {
  $$ClientesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get clienteId => $composableBuilder(
    column: $table.clienteId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get telefono => $composableBuilder(
    column: $table.telefono,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nombre => $composableBuilder(
    column: $table.nombre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get status => $composableBuilder(
    column: $table.status,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get registroFecha => $composableBuilder(
    column: $table.registroFecha,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get actualizacionFecha => $composableBuilder(
    column: $table.actualizacionFecha,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get statusSincronizacion => $composableBuilder(
    column: $table.statusSincronizacion,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ClientesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ClientesTable> {
  $$ClientesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get clienteId =>
      $composableBuilder(column: $table.clienteId, builder: (column) => column);

  GeneratedColumn<String> get telefono =>
      $composableBuilder(column: $table.telefono, builder: (column) => column);

  GeneratedColumn<String> get nombre =>
      $composableBuilder(column: $table.nombre, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<DateTime> get registroFecha => $composableBuilder(
    column: $table.registroFecha,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get actualizacionFecha => $composableBuilder(
    column: $table.actualizacionFecha,
    builder: (column) => column,
  );

  GeneratedColumn<String> get statusSincronizacion => $composableBuilder(
    column: $table.statusSincronizacion,
    builder: (column) => column,
  );
}

class $$ClientesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ClientesTable,
          ClienteEntity,
          $$ClientesTableFilterComposer,
          $$ClientesTableOrderingComposer,
          $$ClientesTableAnnotationComposer,
          $$ClientesTableCreateCompanionBuilder,
          $$ClientesTableUpdateCompanionBuilder,
          (
            ClienteEntity,
            BaseReferences<_$AppDatabase, $ClientesTable, ClienteEntity>,
          ),
          ClienteEntity,
          PrefetchHooks Function()
        > {
  $$ClientesTableTableManager(_$AppDatabase db, $ClientesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ClientesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ClientesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ClientesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> clienteId = const Value.absent(),
                Value<String> telefono = const Value.absent(),
                Value<String> nombre = const Value.absent(),
                Value<String> status = const Value.absent(),
                Value<DateTime> registroFecha = const Value.absent(),
                Value<DateTime?> actualizacionFecha = const Value.absent(),
                Value<String> statusSincronizacion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientesCompanion(
                clienteId: clienteId,
                telefono: telefono,
                nombre: nombre,
                status: status,
                registroFecha: registroFecha,
                actualizacionFecha: actualizacionFecha,
                statusSincronizacion: statusSincronizacion,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String clienteId,
                required String telefono,
                required String nombre,
                Value<String> status = const Value.absent(),
                Value<DateTime> registroFecha = const Value.absent(),
                Value<DateTime?> actualizacionFecha = const Value.absent(),
                Value<String> statusSincronizacion = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ClientesCompanion.insert(
                clienteId: clienteId,
                telefono: telefono,
                nombre: nombre,
                status: status,
                registroFecha: registroFecha,
                actualizacionFecha: actualizacionFecha,
                statusSincronizacion: statusSincronizacion,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$ClientesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ClientesTable,
      ClienteEntity,
      $$ClientesTableFilterComposer,
      $$ClientesTableOrderingComposer,
      $$ClientesTableAnnotationComposer,
      $$ClientesTableCreateCompanionBuilder,
      $$ClientesTableUpdateCompanionBuilder,
      (
        ClienteEntity,
        BaseReferences<_$AppDatabase, $ClientesTable, ClienteEntity>,
      ),
      ClienteEntity,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductosTableTableManager get productos =>
      $$ProductosTableTableManager(_db, _db.productos);
  $$InventarioMovimientosTableTableManager get inventarioMovimientos =>
      $$InventarioMovimientosTableTableManager(_db, _db.inventarioMovimientos);
  $$ClientesTableTableManager get clientes =>
      $$ClientesTableTableManager(_db, _db.clientes);
}
