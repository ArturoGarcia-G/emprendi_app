// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'producto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Producto _$ProductoFromJson(Map<String, dynamic> json) => Producto(
  productoId: json['producto_id'] as String?,
  folio: (json['folio'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  nombre: json['nombre'] as String?,
  stock: (json['stock'] as num?)?.toInt(),
  precio: const StringToDoubleConverter().fromJson(json['precio']),
  costo: const StringToDoubleConverter().fromJson(json['costo']),
  status: json['status'] as String?,
  registroFecha: json['registro_fecha'] == null
      ? null
      : DateTime.parse(json['registro_fecha'] as String),
  registroAutorId: json['registro_autor_id'] as String?,
  actualizacionFecha: json['actualizacion_fecha'] == null
      ? null
      : DateTime.parse(json['actualizacion_fecha'] as String),
  actualizacionAutorId: json['actualizacion_autor_id'] as String?,
  negocioId: json['negocio_id'] as String?,
  statusSincronizacion: json['status_sincronizacion'] as String?,
);

Map<String, dynamic> _$ProductoToJson(Producto instance) => <String, dynamic>{
  'producto_id': instance.productoId,
  'folio': instance.folio,
  'sku': instance.sku,
  'nombre': instance.nombre,
  'stock': instance.stock,
  'precio': const StringToDoubleConverter().toJson(instance.precio),
  'costo': const StringToDoubleConverter().toJson(instance.costo),
  'status': instance.status,
  'registro_fecha': instance.registroFecha?.toIso8601String(),
  'registro_autor_id': instance.registroAutorId,
  'actualizacion_fecha': instance.actualizacionFecha?.toIso8601String(),
  'actualizacion_autor_id': instance.actualizacionAutorId,
  'negocio_id': instance.negocioId,
  'status_sincronizacion': instance.statusSincronizacion,
};
