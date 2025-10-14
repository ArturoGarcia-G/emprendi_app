// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inventario_movimiento.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InventarioMovimiento _$InventarioMovimientoFromJson(
  Map<String, dynamic> json,
) => InventarioMovimiento(
  inventarioMovimientoId: json['inventario_movimiento_id'] as String?,
  negocioId: json['negocio_id'] as String?,
  productoId: json['producto_id'] as String?,
  ventaId: json['venta_id'] as String?,
  cantidad: (json['cantidad'] as num?)?.toInt(),
  descripcion: json['descripcion'] as String?,
  tipo: json['tipo'] as String?,
  registroFecha: json['registro_fecha'] == null
      ? null
      : DateTime.parse(json['registro_fecha'] as String),
  registroAutorId: json['registro_autor_id'] as String?,
  statusSincronizacion: json['status_sincronizacion'] as String?,
);

Map<String, dynamic> _$InventarioMovimientoToJson(
  InventarioMovimiento instance,
) => <String, dynamic>{
  'inventario_movimiento_id': instance.inventarioMovimientoId,
  'negocio_id': instance.negocioId,
  'producto_id': instance.productoId,
  'venta_id': instance.ventaId,
  'cantidad': instance.cantidad,
  'descripcion': instance.descripcion,
  'tipo': instance.tipo,
  'registro_fecha': instance.registroFecha?.toIso8601String(),
  'registro_autor_id': instance.registroAutorId,
  'status_sincronizacion': instance.statusSincronizacion,
};
