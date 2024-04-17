import 'package:chill_guide/features/common/models/poster.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Poster', () {
    test('should return the correct URL for default size', () {
      final poster = Poster('/example.jpg');
      final url = poster.url();
      expect(url, 'https://image.tmdb.org/t/p/w500/example.jpg');
    });
    test('should return the correct URL for extra tiny size', () {
      final poster = Poster('/example.jpg');
      final url = poster.url(PosterSize.extraTiny);
      expect(url, 'https://image.tmdb.org/t/p/w92/example.jpg');
    });
    test('should return the correct URL for tiny size', () {
      final poster = Poster('/example.jpg');
      final url = poster.url(PosterSize.tiny);
      expect(url, 'https://image.tmdb.org/t/p/w154/example.jpg');
    });
    test('should return the correct URL for small size', () {
      final poster = Poster('/example.jpg');
      final url = poster.url(PosterSize.small);
      expect(url, 'https://image.tmdb.org/t/p/w185/example.jpg');
    });

    test('should return the correct URL for medium size', () {
      final poster = Poster('/example.jpg');
      final url = poster.url(PosterSize.medium);
      expect(url, 'https://image.tmdb.org/t/p/w342/example.jpg');
    });

    test('should return the correct URL for large size', () {
      final poster = Poster('/example.jpg');
      final url = poster.url(PosterSize.large);
      expect(url, 'https://image.tmdb.org/t/p/w500/example.jpg');
    });

    test('should return the correct URL for extra large size', () {
      final poster = Poster('/example.jpg');
      final url = poster.url(PosterSize.extraLarge);
      expect(url, 'https://image.tmdb.org/t/p/w780/example.jpg');
    });

    test('should return the correct URL for original size', () {
      final poster = Poster('/example.jpg');
      final url = poster.url(PosterSize.original);
      expect(url, 'https://image.tmdb.org/t/p/original/example.jpg');
    });
  });
}
