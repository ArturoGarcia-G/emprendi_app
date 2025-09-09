// models/producto.dart
import 'package:json_annotation/json_annotation.dart';

part 'producto.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Producto {
  String? productoId;
  int? folio;
  String? sku;
  String? nombre;
  int? stock;

  @StringToDoubleConverter()
  double? precio;

  @StringToDoubleConverter()
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

  factory Producto.fromJson(Map<String, dynamic> json) =>
      _$ProductoFromJson(json);

  Map<String, dynamic> toJson() => _$ProductoToJson(this);
}

class StringToDoubleConverter implements JsonConverter<double?, dynamic> {
  const StringToDoubleConverter();

  @override
  double? fromJson(dynamic json) {
    if (json == null) return null;
    if (json is num) return json.toDouble();
    if (json is String) return double.tryParse(json);
    return null;
  }

  @override
  dynamic toJson(double? object) => object;
}
