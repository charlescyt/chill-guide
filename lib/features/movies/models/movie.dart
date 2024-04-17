import 'package:flutter/foundation.dart' show immutable;

@immutable
class Movie {
  final String title;

  const Movie({
    required this.title,
  });
}
