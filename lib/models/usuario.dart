// models/usuario.dart
import 'package:json_annotation/json_annotation.dart';

part 'usuario.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Usuario {
  String? usuarioId;
  String? nombreCompleto;
  String? usuario;
  @JsonKey(ignore: true)
  String? password;
  String? status;
  String? registroFecha;
  String? registroAutorId;
  String? actualizacionFecha;
  String? actualizacionAutorId;
  String? idNegocio;

  Usuario({
    this.usuarioId,
    this.nombreCompleto,
    this.usuario,
    this.password,
    this.status,
    this.registroFecha,
    this.registroAutorId,
    this.actualizacionFecha,
    this.actualizacionAutorId,
    this.idNegocio,
  });

  /// Generado automáticamente con json_serializable
  factory Usuario.fromJson(Map<String, dynamic> json) =>
      _$UsuarioFromJson(json);

  Map<String, dynamic> toJson() => _$UsuarioToJson(this);
}
