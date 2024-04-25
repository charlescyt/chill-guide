import 'package:flutter/material.dart';

import '../../movies/models/movie_genre.dart';
import '../../tv_shows/models/tv_show_genre.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
    required this.label,
    required this.imageAssetPath,
    required this.onTap,
  });

  final String label;
  final String imageAssetPath;
  final VoidCallback onTap;

  factory GenreCard.movie({
    required MovieGenre genre,
    required VoidCallback onTap,
  }) {
    return GenreCard(
      label: genre.label,
      imageAssetPath: genre.imageAssetPath,
      onTap: onTap,
    );
  }

  factory GenreCard.tvShow({
    required TvShowGenre genre,
    required VoidCallback onTap,
  }) {
    return GenreCard(
      label: genre.label,
      imageAssetPath: genre.imageAssetPath,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);
    final color = theme.colorScheme.background.withOpacity(0.3);

    return Card(
      child: InkWell(
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAssetPath),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(color, BlendMode.srcOver),
            ),
          ),
          child: Center(
            child: Text(
              label,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}
