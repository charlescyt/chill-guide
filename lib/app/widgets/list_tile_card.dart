import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../features/movies/models/movie.dart';
import '../../features/tv_shows/models/tv_show.dart';
import 'placeholder_icon.dart';
import 'rating_indicator.dart';

class ListTileCard extends StatelessWidget {
  const ListTileCard({
    super.key,
    required this.title,
    this.overview,
    required this.rating,
    this.backdropPath,
    this.posterPath,
    required this.onTap,
    this.height = 200,
  });

  final String title;
  final String? overview;
  final double rating;
  final BackdropPath? backdropPath;
  final PosterPath? posterPath;
  final VoidCallback? onTap;
  final double height;

  factory ListTileCard.movie({
    required Movie movie,
    required VoidCallback onTap,
  }) {
    return ListTileCard(
      title: movie.titleAndReleaseYear,
      overview: movie.overview,
      rating: movie.voteAverage,
      backdropPath: movie.backdropPath,
      posterPath: movie.posterPath,
      onTap: onTap,
    );
  }

  factory ListTileCard.tvShow({
    required TvShow tvShow,
    required VoidCallback onTap,
  }) {
    return ListTileCard(
      title: tvShow.nameAndFirstAirYear,
      overview: tvShow.overview,
      rating: tvShow.voteAverage,
      backdropPath: tvShow.backdropPath,
      posterPath: tvShow.posterPath,
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final poster = switch (posterPath) {
      null => PlaceholderIcon(
          icon: const Icon(Icons.movie),
          color: theme.colorScheme.primary,
        ),
      final posterPath => Ink.image(
          image: NetworkImage(posterPath.url()),
          fit: BoxFit.cover,
        )
    };

    return Card(
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: height,
          child: Stack(
            children: [
              if (backdropPath case final backdropPath?)
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.7),
                    ),
                    child: Ink.image(
                      image: NetworkImage(backdropPath.url()),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 2 / 3,
                      child: Card(
                        child: poster,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              title,
                              style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (rating > 0) //
                              RatingIndicator(rating: rating),
                            if (overview case final overview?)
                              Text(
                                overview,
                                style: theme.textTheme.bodyMedium,
                                maxLines: 5,
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ListTileCardSkeleton extends StatelessWidget {
  const ListTileCardSkeleton({
    super.key,
    this.height = 200,
  });

  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Skeletonizer.zone(
      child: Card(
        child: SizedBox(
          height: height,
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Card(
                    child: Bone.square(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Bone.text(
                          words: 1,
                          style: theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        const Skeleton.shade(
                          child: RatingIndicator(rating: 8),
                        ),
                        const SizedBox(height: 4),
                        Bone.multiText(
                          lines: 5,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
