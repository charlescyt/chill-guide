import 'package:flutter/material.dart';

import '../../../app/widgets/app_card.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.onTap,
  });

  final Movie movie;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final background = switch (movie.posterPath) {
      null => PlaceholderIcon(
          icon: const Icon(Icons.movie),
          color: theme.colorScheme.primary,
        ),
      final poster => Ink.image(
          image: NetworkImage(poster.url()),
          fit: BoxFit.cover,
        ),
    };

    return AppCard(
      background: background,
      onTap: onTap,
      title: movie.title,
      subTitle: movie.releaseDate?.year.toString() ?? '',
    );
  }
}

class MovieCardSkeleton extends StatelessWidget {
  const MovieCardSkeleton({
    super.key,
    this.showSubtitle = true,
  });

  final bool showSubtitle;

  @override
  Widget build(BuildContext context) {
    return AppCardSkeleton(
      showSubTitle: showSubtitle,
      backgroundPlaceholder: const PlaceholderIcon(
        icon: Icon(Icons.movie),
      ),
    );
  }
}
