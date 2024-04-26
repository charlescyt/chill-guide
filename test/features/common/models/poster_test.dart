import 'package:chill_guide/features/common/models/image_path.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Poster', () {
    test('should return the correct URL for default quality', () {
      const poster = PosterPath('/example.jpg');
      final url = poster.url();
      expect(url, 'https://image.tmdb.org/t/p/w780/example.jpg');
    });

    test('should return the correct URL for low quality', () {
      const poster = PosterPath('/example.jpg');
      final url = poster.url(ImageQuality.low);
      expect(url, 'https://image.tmdb.org/t/p/w342/example.jpg');
    });

    test('should return the correct URL for medium quality', () {
      const poster = PosterPath('/example.jpg');
      final url = poster.url(ImageQuality.medium);
      expect(url, 'https://image.tmdb.org/t/p/w500/example.jpg');
    });

    test('should return the correct URL for high quality', () {
      const poster = PosterPath('/example.jpg');
      final url = poster.url(ImageQuality.high);
      expect(url, 'https://image.tmdb.org/t/p/w780/example.jpg');
    });
  });
}
