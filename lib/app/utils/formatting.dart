import 'package:intl/intl.dart';

String formatCurrency(int amount) {
  return NumberFormat.currency(
    locale: 'en_US',
    decimalDigits: 0,
    symbol: r'$',
  ).format(amount);
}

String formatRuntime(int runtime) {
  final hours = runtime ~/ 60;
  final minutes = runtime % 60;

  return '${hours}h ${minutes}m';
}

String formatDate(DateTime date) {
  return DateFormat.yMMMMd().format(date);
}
