import '../../../tmdb/tmdb_constants.dart';
import '../../../tmdb/tmdb_options.dart';
import 'image_quality.dart';

export 'image_quality.dart';

extension type const ProfilePath(String value) {
  String url([ImageQuality quality = ImageQuality.high]) {
    final size = switch (quality) {
      ImageQuality.low => ProfileSize.small.value,
      ImageQuality.medium => ProfileSize.medium.value,
      ImageQuality.high => ProfileSize.large.value,
    };

    return '${TmdbConstants.imageBaseUrl}/$size$value';
  }
}
