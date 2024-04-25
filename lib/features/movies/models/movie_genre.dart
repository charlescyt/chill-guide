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
}
