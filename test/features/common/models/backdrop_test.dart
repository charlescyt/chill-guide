import 'package:chill_guide/features/common/models/backdrop.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Backdrop', () {
    test('should return the correct URL for default size', () {
      final backdrop = Backdrop('/example.jpg');
      final url = backdrop.url();
      expect(url, 'https://image.tmdb.org/t/p/w1280/example.jpg');
    });
    test('should return the correct URL for small size', () {
      final backdrop = Backdrop('/example.jpg');
      final url = backdrop.url(BackdropSize.small);
      expect(url, 'https://image.tmdb.org/t/p/w300/example.jpg');
    });

    test('should return the correct URL for medium size', () {
      final backdrop = Backdrop('/example.jpg');
      final url = backdrop.url(BackdropSize.medium);
      expect(url, 'https://image.tmdb.org/t/p/w780/example.jpg');
    });

    test('should return the correct URL for large size', () {
      final backdrop = Backdrop('/example.jpg');
      final url = backdrop.url(BackdropSize.large);
      expect(url, 'https://image.tmdb.org/t/p/w1280/example.jpg');
    });

    test('should return the correct URL for extra large size', () {
      final backdrop = Backdrop('/example.jpg');
      final url = backdrop.url(BackdropSize.extraLarge);
      expect(url, 'https://image.tmdb.org/t/p/w1920/example.jpg');
    });

    test('should return the correct URL for original size', () {
      final backdrop = Backdrop('/example.jpg');
      final url = backdrop.url(BackdropSize.original);
      expect(url, 'https://image.tmdb.org/t/p/original/example.jpg');
    });
  });
}
