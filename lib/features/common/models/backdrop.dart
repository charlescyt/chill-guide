import '../../../tmdb/tmdb_constants.dart';
import '../../../tmdb/tmdb_options.dart';
import 'image_quality.dart';

extension type const Backdrop(String path) {
  String url([ImageQuality quality = ImageQuality.high]) {
    final size = switch (quality) {
      ImageQuality.low => BackdropSize.small.value,
      ImageQuality.medium => BackdropSize.medium.value,
      ImageQuality.high => BackdropSize.large.value,
    };

    return '${TmdbConstants.imageBaseUrl}/$size$path';
  }
}
