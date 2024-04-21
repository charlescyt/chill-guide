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

  if (hours == 0) {
    return '${minutes}m';
  }

  return '${hours}h ${minutes}m';
}

String formatDate(DateTime date) {
  return DateFormat.yMMMMd().format(date);
}

String formatEpisodeAirDateAndRuntime(DateTime? airDate, int? runtime) {
  final formattedAirDate = airDate == null ? 'Unknown air date' : formatDate(airDate);
  final formattedRuntime = runtime == null ? 'Unknown runtime' : formatRuntime(runtime);

  return '$formattedAirDate • $formattedRuntime';
}
