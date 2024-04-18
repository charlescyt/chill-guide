import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../app/widgets/placeholder_icon.dart';
import '../models/movie.dart';

class MovieLandscapeCard extends StatelessWidget {
  const MovieLandscapeCard({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);

    final background = switch (movie.backdrop) {
      null => PlaceholderIcon(
          icon: const Icon(Icons.movie),
          color: theme.colorScheme.primary,
        ),
      final backdrop => Ink.image(
          image: NetworkImage(backdrop.url()),
          fit: BoxFit.cover,
        )
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
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              movie.titleAndReleaseYear,
              style: textStyle,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ],
    );
  }
}

class MovieLandscapeCardSkeleton extends StatelessWidget {
  const MovieLandscapeCardSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);

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
          Center(
            child: Bone.text(words: 2, style: textStyle),
          ),
        ],
      ),
    );
  }
}
