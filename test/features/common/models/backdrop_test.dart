import 'package:chill_guide/features/common/models/image_path.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Backdrop', () {
    test('should return the correct URL for default quality', () {
      const backdrop = BackdropPath('/example.jpg');
      final url = backdrop.url();
      expect(url, 'https://image.tmdb.org/t/p/w1280/example.jpg');
    });

    test('should return the correct URL for low quality', () {
      const backdrop = BackdropPath('/example.jpg');
      final url = backdrop.url(ImageQuality.low);
      expect(url, 'https://image.tmdb.org/t/p/w300/example.jpg');
    });

    test('should return the correct URL for medium quality', () {
      const backdrop = BackdropPath('/example.jpg');
      final url = backdrop.url(ImageQuality.medium);
      expect(url, 'https://image.tmdb.org/t/p/w780/example.jpg');
    });

    test('should return the correct URL for high quality', () {
      const backdrop = BackdropPath('/example.jpg');
      final url = backdrop.url(ImageQuality.high);
      expect(url, 'https://image.tmdb.org/t/p/w1280/example.jpg');
    });
  });
}
