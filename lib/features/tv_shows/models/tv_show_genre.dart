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
}
