import 'package:intl/intl.dart';

class PriceFormat {
  // Format a double value as currency
  static String format(double price) {
    final formatter = NumberFormat.currency(
      locale: 'en_PH',  // Philippine Peso currency formatting
      symbol: '₱',      // Currency symbol for Philippine Peso
      decimalDigits: 2, // Display 2 decimal places
    );
    return formatter.format(price);
  }
}
