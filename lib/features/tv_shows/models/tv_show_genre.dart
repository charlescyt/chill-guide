enum TvShowGenre {
  actionAndAdventure,
  animation,
  // comedy,
  crime,
  documentary,
  drama,
  // family,
  // kids,
  mystery,
  // news,
  // reality,
  scifiAndFantasy,
  // soap,
  // talk,
  warAndPolitics,
  // western,
  ;

  String get label {
    return switch (this) {
      actionAndAdventure => 'Action & Adventure',
      animation => 'Animation',
      crime => 'Crime',
      documentary => 'Documentary',
      drama => 'Drama',
      mystery => 'Mystery',
      scifiAndFantasy => 'Sci-Fi & Fantasy',
      warAndPolitics => 'War & Politics',
    };
  }

  String get imageAssetPath {
    final fileName = switch (this) {
      actionAndAdventure => 'action_and_adventure',
      animation => 'animation',
      crime => 'crime',
      documentary => 'documentary',
      drama => 'drama',
      mystery => 'mystery',
      scifiAndFantasy => 'scifi_and_fantasy',
      warAndPolitics => 'war_and_politics',
    };

    return 'assets/images/genres/tv_show/$fileName.jpg';
  }

  int get tmdbId {
    return switch (this) {
      actionAndAdventure => 10759,
      animation => 16,
      crime => 80,
      documentary => 99,
      drama => 18,
      mystery => 9648,
      scifiAndFantasy => 10765,
      warAndPolitics => 10768,
    };
  }

  static TvShowGenre fromTmdbId(int id) {
    return switch (id) {
      10759 => actionAndAdventure,
      16 => animation,
      80 => crime,
      99 => documentary,
      18 => drama,
      9648 => mystery,
      10765 => scifiAndFantasy,
      10768 => warAndPolitics,
      _ => throw ArgumentError('Invalid tv show genre id: $id'),
    };
  }
}
