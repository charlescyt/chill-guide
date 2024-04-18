import '../../../tmdb/tmdb_constants.dart';
import '../../../tmdb/tmdb_options.dart';
import 'image_quality.dart';

export 'image_quality.dart';

extension type const PosterPath(String value) {
  String url([ImageQuality quality = ImageQuality.high]) {
    final size = switch (quality) {
      ImageQuality.low => PosterSize.medium.value,
      ImageQuality.medium => PosterSize.large.value,
      ImageQuality.high => PosterSize.extraLarge.value,
    };

    return '${TmdbConstants.imageBaseUrl}/$size$value';
  }
}
