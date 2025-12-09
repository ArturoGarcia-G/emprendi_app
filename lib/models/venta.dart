import 'package:json_annotation/json_annotation.dart';

part 'venta.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Venta {
  String? ventaId;
  String? clienteId;
  String? negocioId;
  double? total;
  int? folio;
  String? status;
  DateTime? registroFecha;
  String? registroAutorId;
  DateTime? actualizacionFecha;
  String? actualizacionAutorId;
  String? statusSincronizacion;

  // Información del cliente (solo para consultas locales, no se envía al API)
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? clienteNombre;
  @JsonKey(includeFromJson: false, includeToJson: false)
  String? clienteTelefono;

  Venta({
    this.ventaId,
    this.clienteId,
    this.negocioId,
    this.total,
    this.folio,
    this.status,
    this.registroFecha,
    this.registroAutorId,
    this.actualizacionFecha,
    this.actualizacionAutorId,
    this.statusSincronizacion,
    this.clienteNombre,
    this.clienteTelefono,
  });

  factory Venta.fromJson(Map<String, dynamic> json) =>
      _$VentaFromJson(json);

  Map<String, dynamic> toJson() => _$VentaToJson(this);
}