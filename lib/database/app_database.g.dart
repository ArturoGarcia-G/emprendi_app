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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductosTable productos = $ProductosTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [productos];
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductosTableTableManager get productos =>
      $$ProductosTableTableManager(_db, _db.productos);
}
