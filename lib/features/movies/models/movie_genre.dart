enum MovieGenre {
  action,
  adventure,
  animation,
  comedy,
  crime,
  documentary,
  // drama,
  // family,
  fantasy,
  history,
  horror,
  // music,
  mystery,
  romance,
  scienceFiction,
  // tvMovie,
  thriller,
  war,
  // western,
  ;

  String get label {
    return switch (this) {
      action => 'Action',
      adventure => 'Adventure',
      animation => 'Animation',
      comedy => 'Comedy',
      crime => 'Crime',
      documentary => 'Documentary',
      fantasy => 'Fantasy',
      history => 'History',
      horror => 'Horror',
      mystery => 'Mystery',
      romance => 'Romance',
      scienceFiction => 'Science Fiction',
      thriller => 'Thriller',
      war => 'War',
    };
  }

  String get imageAssetPath {
    final fileName = switch (this) {
      action => 'action',
      adventure => 'adventure',
      animation => 'animation',
      comedy => 'comedy',
      crime => 'crime',
      documentary => 'documentary',
      fantasy => 'fantasy',
      history => 'history',
      horror => 'horror',
      mystery => 'mystery',
      romance => 'romance',
      scienceFiction => 'science_fiction',
      thriller => 'thriller',
      war => 'war',
    };

    return 'assets/images/genres/movie/$fileName.jpg';
  }

  int get tmdbId {
    return switch (this) {
      action => 28,
      adventure => 12,
      animation => 16,
      comedy => 35,
      crime => 80,
      documentary => 99,
      fantasy => 14,
      history => 36,
      horror => 27,
      mystery => 9648,
      romance => 10749,
      scienceFiction => 878,
      thriller => 53,
      war => 10752,
    };
  }

  static MovieGenre fromTmdbId(int id) {
    return switch (id) {
      28 => action,
      12 => adventure,
      16 => animation,
      35 => comedy,
      80 => crime,
      99 => documentary,
      14 => fantasy,
      36 => history,
      27 => horror,
      9648 => mystery,
      10749 => romance,
      878 => scienceFiction,
      53 => thriller,
      10752 => war,
      _ => throw ArgumentError('Invalid movie genre id: $id'),
    };
  }
}
