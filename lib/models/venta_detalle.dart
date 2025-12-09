import 'package:json_annotation/json_annotation.dart';

part 'venta_detalle.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class VentaDetalle {
  String? ventaDetalleId;
  String? ventaId;
  String? negocioId;
  String? productoId;
  double? precioUnitario;
  int? cantidad;
  double? subtotal;
  DateTime? registroFecha;
  String? registroAutorId;
  DateTime? actualizacionFecha;
  String? actualizacionAutorId;
  String? statusSincronizacion;

  VentaDetalle({
    this.ventaDetalleId,
    this.ventaId,
    this.negocioId,
    this.productoId,
    this.precioUnitario,
    this.cantidad,
    this.subtotal,
    this.registroFecha,
    this.registroAutorId,
    this.actualizacionFecha,
    this.actualizacionAutorId,
    this.statusSincronizacion,
  });

  factory VentaDetalle.fromJson(Map<String, dynamic> json) =>
      _$VentaDetalleFromJson(json);

  Map<String, dynamic> toJson() => _$VentaDetalleToJson(this);
}