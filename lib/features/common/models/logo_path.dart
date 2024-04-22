import '../../../tmdb/tmdb_constants.dart';
import '../../../tmdb/tmdb_options.dart';
import 'image_quality.dart';

extension type const LogoPath(String path) {
  String url([ImageQuality quality = ImageQuality.high]) {
    final size = switch (quality) {
      ImageQuality.low => LogoSize.tiny.value,
      ImageQuality.medium => LogoSize.small.value,
      ImageQuality.high => LogoSize.medium.value,
    };

    return '${TmdbConstants.imageBaseUrl}/$size$path';
  }
}
