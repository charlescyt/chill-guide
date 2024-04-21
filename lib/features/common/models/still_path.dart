import '../../../tmdb/tmdb_constants.dart';
import '../../../tmdb/tmdb_options.dart';
import 'image_quality.dart';

export 'image_quality.dart';

extension type const StillPath(String value) {
  String url([ImageQuality quality = ImageQuality.high]) {
    final size = switch (quality) {
      ImageQuality.low => StillSize.medium.value,
      ImageQuality.medium => StillSize.large.value,
      ImageQuality.high => StillSize.extraLarge.value,
    };

    return '${TmdbConstants.imageBaseUrl}/$size$value';
  }
}
