// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'venta.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Venta _$VentaFromJson(Map<String, dynamic> json) => Venta(
  ventaId: json['venta_id'] as String?,
  clienteId: json['cliente_id'] as String?,
  negocioId: json['negocio_id'] as String?,
  total: _doubleFromJson(json['total']),
  folio: (json['folio'] as num?)?.toInt(),
  status: json['status'] as String?,
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

Map<String, dynamic> _$VentaToJson(Venta instance) => <String, dynamic>{
  'venta_id': instance.ventaId,
  'cliente_id': instance.clienteId,
  'negocio_id': instance.negocioId,
  'total': _doubleToJson(instance.total),
  'folio': instance.folio,
  'status': instance.status,
  'registro_fecha': instance.registroFecha?.toIso8601String(),
  'registro_autor_id': instance.registroAutorId,
  'actualizacion_fecha': instance.actualizacionFecha?.toIso8601String(),
  'actualizacion_autor_id': instance.actualizacionAutorId,
  'status_sincronizacion': instance.statusSincronizacion,
};
