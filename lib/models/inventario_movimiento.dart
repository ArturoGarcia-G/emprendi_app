// models/inventario_movimiento.dart
import 'package:json_annotation/json_annotation.dart';

part 'inventario_movimiento.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class InventarioMovimiento {
  String? inventarioMovimientoId;
  String? negocioId;
  String? productoId;
  String? ventaId;
  int? cantidad;
  String? descripcion;
  String? tipo;
  DateTime? registroFecha;
  String? registroAutorId;
  String? statusSincronizacion;

  InventarioMovimiento({
    this.inventarioMovimientoId,
    this.negocioId,
    this.productoId,
    this.ventaId,
    this.cantidad,
    this.descripcion,
    this.tipo,
    this.registroFecha,
    this.registroAutorId,
    this.statusSincronizacion,
  });

  factory InventarioMovimiento.fromJson(Map<String, dynamic> json) =>
      _$InventarioMovimientoFromJson(json);

  Map<String, dynamic> toJson() => _$InventarioMovimientoToJson(this);
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
