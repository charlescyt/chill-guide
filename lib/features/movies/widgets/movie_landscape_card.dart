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

    return Card(
      child: InkWell(
        onTap: () {
          // TODO(charlescyt): Navigate to movie details page
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            background,
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ColoredBox(
                color: theme.colorScheme.surface.withOpacity(0.8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(
                    movie.title,
                    style: textStyle,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
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
      child: Card(
        child: Stack(
          fit: StackFit.expand,
          children: [
            const Skeleton.shade(
              child: PlaceholderIcon(
                icon: Icon(Icons.movie),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Bone.text(words: 2, style: textStyle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
