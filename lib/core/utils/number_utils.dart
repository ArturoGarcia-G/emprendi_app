import 'package:intl/intl.dart';

class NumberUtils {
  // Método para formato de moneda con soporte de localización
  static String formatMoney(
    double value, {
    String locale = 'es_MX',
    String symbol = '\$',
  }) {
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: symbol,
      decimalDigits: 2,
    );
    return formatter.format(value);
  }

  // Si necesitas mostrar sin símbolo
  static String formatNumber(
    num value, {
    String locale = 'es_MX',
    int decimales = 2,
  }) {
    final formatter = NumberFormat.currency(
      locale: locale,
      symbol: '',
      decimalDigits: decimales,
    );
    return formatter.format(value).trim();
  }
}
