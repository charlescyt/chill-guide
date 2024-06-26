import 'package:flutter/material.dart';

import '../../../app/widgets/app_card.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../models/movie.dart';

class MovieLandscapeCard extends StatelessWidget {
  const MovieLandscapeCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final background = switch (movie.backdropPath) {
      null => PlaceholderIcon(
          icon: const Icon(Icons.movie),
          color: theme.colorScheme.primary,
        ),
      final backdrop => Ink.image(
          image: NetworkImage(backdrop.url()),
          fit: BoxFit.cover,
        )
    };

    return AppCard(
      background: background,
      onTap: onTap,
      title: movie.titleAndReleaseYear,
    );
  }
}
