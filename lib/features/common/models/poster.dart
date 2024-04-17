import '../../../tmdb/tmdb_constants.dart';

extension type Poster(String path) {
  String url([PosterSize size = PosterSize.large]) => '${TmdbConstants.imageBaseUrl}/${size.value}$path';
}

enum PosterSize {
  extraTiny('w92'),
  tiny('w154'),
  small('w185'),
  medium('w342'),
  large('w500'),
  extraLarge('w780'),
  original('original');

  const PosterSize(this.value);

  final String value;
}
