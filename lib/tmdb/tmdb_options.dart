enum TimeWindow {
  day,
  week,
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

enum BackdropSize {
  small('w300'),
  medium('w780'),
  large('w1280'),
  extraLarge('w1920'),
  original('original');

  const BackdropSize(this.value);

  final String value;
}
