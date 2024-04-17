import '../../../tmdb/tmdb_constants.dart';

extension type Backdrop(String path) {
  String url([BackdropSize size = BackdropSize.large]) => '${TmdbConstants.imageBaseUrl}/${size.value}$path';
}

enum BackdropSize {
  small('w300'),
  medium('w780'),
  large('w1280'),
  extraLarge('w1920'),
  original('original');

  const BackdropSize(this.value);

  final String value;
}
