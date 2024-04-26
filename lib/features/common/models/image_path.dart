import '../../../tmdb/tmdb_constants.dart';
import '../../../tmdb/tmdb_options.dart';
import 'image_quality.dart';

export 'image_quality.dart';

extension type const BackdropPath(String path) {
  String url([ImageQuality quality = ImageQuality.high]) {
    final size = switch (quality) {
      ImageQuality.low => BackdropSize.small.value,
      ImageQuality.medium => BackdropSize.medium.value,
      ImageQuality.high => BackdropSize.large.value,
    };

    return '${TmdbConstants.imageBaseUrl}/$size$path';
  }
}

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
