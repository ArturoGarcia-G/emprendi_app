// models/producto.dart
import 'package:json_annotation/json_annotation.dart';

part 'producto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Producto {
  String? productoId;
  String? folio;
  String? sku;
  String? nombre;
  int? stock;
  double? precio;
  double? costo;
  String? status;
  String? registroFecha;
  String? registroAutorId;
  String? actualizacionFecha;
  String? actualizacionAutorId;
  String? negocioId;

  Producto({
    this.productoId,
    this.folio,
    this.sku,
    this.nombre,
    this.stock,
    this.precio,
    this.costo,
    this.status,
    this.registroFecha,
    this.registroAutorId,
    this.actualizacionFecha,
    this.actualizacionAutorId,
    this.negocioId,
  });

  /// Generado automáticamente con json_serializable
  factory Producto.fromJson(Map<String, dynamic> json) =>
      _$ProductoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductoToJson(this);
}
