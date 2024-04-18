import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../app/widgets/placeholder_icon.dart';
import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);
    final subTitleStyle = theme.textTheme.bodySmall?.copyWith();

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

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Card(
            child: InkWell(
              onTap: () {
                // TODO(charlescyt): Navigate to movie details page
              },
              child: background,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            movie.title,
            style: titleStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            movie.releaseDate?.year.toString() ?? '',
            style: subTitleStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class MovieCardSkeleton extends StatelessWidget {
  const MovieCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);
    final subTitleStyle = theme.textTheme.bodySmall?.copyWith();

    return Skeletonizer.zone(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: Card(
              child: Skeleton.shade(
                child: PlaceholderIcon(
                  icon: Icon(Icons.movie),
                ),
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Bone.text(width: 100, style: titleStyle),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Bone.text(width: 40, style: subTitleStyle),
          ),
        ],
      ),
    );
  }
}
