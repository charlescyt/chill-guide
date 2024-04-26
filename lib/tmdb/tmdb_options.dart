enum TimeWindow {
  day,
  week,
}

enum BackdropSize {
  small('w300'),
  medium('w780'),
  large('w1280'),
  original('original');

  const BackdropSize(this.value);

  final String value;
}

enum LogoSize {
  extraTiny('w45'),
  tiny('w92'),
  small('w154'),
  medium('w185'),
  large('w300'),
  extraLarge('w500'),
  original('original');

  const LogoSize(this.value);

  final String value;
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

enum ProfileSize {
  small('w45'),
  medium('w185'),
  large('h632'),
  extraLarge('original');

  const ProfileSize(this.value);

  final String value;
}

enum StillSize {
  small('w92'),
  medium('w185'),
  large('w300'),
  extraLarge('original');

  const StillSize(this.value);

  final String value;
}
