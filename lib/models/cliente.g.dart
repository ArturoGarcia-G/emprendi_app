// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cliente.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Cliente _$ClienteFromJson(Map<String, dynamic> json) => Cliente(
  clienteId: json['cliente_id'] as String?,
  folioLocal: (json['folio_local'] as num?)?.toInt(),
  folioGlobal: (json['folio_global'] as num?)?.toInt(),
  telefono: json['telefono'] as String?,
  nombre: json['nombre'] as String?,
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

Map<String, dynamic> _$ClienteToJson(Cliente instance) => <String, dynamic>{
  'cliente_id': instance.clienteId,
  'folio_local': instance.folioLocal,
  'folio_global': instance.folioGlobal,
  'telefono': instance.telefono,
  'nombre': instance.nombre,
  'status': instance.status,
  'registro_fecha': instance.registroFecha?.toIso8601String(),
  'registro_autor_id': instance.registroAutorId,
  'actualizacion_fecha': instance.actualizacionFecha?.toIso8601String(),
  'actualizacion_autor_id': instance.actualizacionAutorId,
  'negocio_id': instance.negocioId,
  'status_sincronizacion': instance.statusSincronizacion,
};
