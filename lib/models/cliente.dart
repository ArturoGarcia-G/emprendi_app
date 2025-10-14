import 'package:json_annotation/json_annotation.dart';

part 'cliente.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Cliente {
  String? clienteId;
  int? folioLocal;
  int? folioGlobal;
  String? telefono;
  String? nombre;

  String? status;
  DateTime? registroFecha;
  String? registroAutorId;
  DateTime? actualizacionFecha;
  String? actualizacionAutorId;
  String? negocioId;
  String? statusSincronizacion;

  Cliente({
    this.clienteId,
    this.folioLocal,
    this.folioGlobal,
    this.telefono,
    this.nombre,
    this.status,
    this.registroFecha,
    this.registroAutorId,
    this.actualizacionFecha,
    this.actualizacionAutorId,
    this.negocioId,
    this.statusSincronizacion,
  });

  factory Cliente.fromJson(Map<String, dynamic> json) =>
      _$ClienteFromJson(json);

  Map<String, dynamic> toJson() => _$ClienteToJson(this);
}
