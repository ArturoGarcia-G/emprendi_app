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
  registroFecha: json['registro_fecha'] as String?,
  registroAutorId: json['registro_autor_id'] as String?,
  actualizacionFecha: json['actualizacion_fecha'] as String?,
  actualizacionAutorId: json['actualizacion_autor_id'] as String?,
  idNegocio: json['id_negocio'] as String?,
);

Map<String, dynamic> _$UsuarioToJson(Usuario instance) => <String, dynamic>{
  'usuario_id': instance.usuarioId,
  'nombre_completo': instance.nombreCompleto,
  'usuario': instance.usuario,
  'status': instance.status,
  'registro_fecha': instance.registroFecha,
  'registro_autor_id': instance.registroAutorId,
  'actualizacion_fecha': instance.actualizacionFecha,
  'actualizacion_autor_id': instance.actualizacionAutorId,
  'id_negocio': instance.idNegocio,
};
