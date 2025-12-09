// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venta_detalle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VentaDetalle _$VentaDetalleFromJson(Map<String, dynamic> json) => VentaDetalle(
  ventaDetalleId: json['venta_detalle_id'] as String?,
  ventaId: json['venta_id'] as String?,
  negocioId: json['negocio_id'] as String?,
  productoId: json['producto_id'] as String?,
  precioUnitario: (json['precio_unitario'] as num?)?.toDouble(),
  cantidad: (json['cantidad'] as num?)?.toInt(),
  subtotal: (json['subtotal'] as num?)?.toDouble(),
  registroFecha: json['registro_fecha'] == null
      ? null
      : DateTime.parse(json['registro_fecha'] as String),
  registroAutorId: json['registro_autor_id'] as String?,
  actualizacionFecha: json['actualizacion_fecha'] == null
      ? null
      : DateTime.parse(json['actualizacion_fecha'] as String),
  actualizacionAutorId: json['actualizacion_autor_id'] as String?,
  statusSincronizacion: json['status_sincronizacion'] as String?,
);

Map<String, dynamic> _$VentaDetalleToJson(VentaDetalle instance) =>
    <String, dynamic>{
      'venta_detalle_id': instance.ventaDetalleId,
      'venta_id': instance.ventaId,
      'negocio_id': instance.negocioId,
      'producto_id': instance.productoId,
      'precio_unitario': instance.precioUnitario,
      'cantidad': instance.cantidad,
      'subtotal': instance.subtotal,
      'registro_fecha': instance.registroFecha?.toIso8601String(),
      'registro_autor_id': instance.registroAutorId,
      'actualizacion_fecha': instance.actualizacionFecha?.toIso8601String(),
      'actualizacion_autor_id': instance.actualizacionAutorId,
      'status_sincronizacion': instance.statusSincronizacion,
    };
