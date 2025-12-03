// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usuario.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Usuario _$UsuarioFromJson(Map<String, dynamic> json) => Usuario(
  usuarioId: json['usuario_id'] as String?,
  nombreCompleto: json['nombre_completo'] as String?,
  usuario: json['usuario'] as String?,
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

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
  'usuario_id': instance.usuarioId,
  'nombre_completo': instance.nombreCompleto,
  'usuario': instance.usuario,
  'status': instance.status,
  'registro_fecha': instance.registroFecha?.toIso8601String(),
  'registro_autor_id': instance.registroAutorId,
  'actualizacion_fecha': instance.actualizacionFecha?.toIso8601String(),
  'actualizacion_autor_id': instance.actualizacionAutorId,
  'negocio_id': instance.negocioId,
  'status_sincronizacion': instance.statusSincronizacion,
};
