import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/widgets/carousel.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../../../app/widgets/rating_indicator.dart';
import '../../../app/widgets/section.dart';
import '../models/movie_details.dart';
import '../providers/movies_provider.dart';
import '../widgets/movie_cast_card.dart';

class MovieDetailsPage extends ConsumerWidget {
  const MovieDetailsPage({
    super.key,
    required this.movieId,
  });

  final int movieId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncMovieDetails = ref.watch(movieDetailsProvider(movieId: movieId));

    return SizedBox.expand(
      child: Material(
        child: switch (asyncMovieDetails) {
          AsyncData(value: final movieDetails) => _Data(movieDetails),
          AsyncError(:final error) => _Error(error: error),
          _ => const _Loading(),
        },
      ),
    );
  }
}

class _Data extends StatelessWidget {
  const _Data(this.movieDetails);

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final background = switch (movieDetails.backdropPath) {
      null => PlaceholderIcon(
          icon: const Icon(Icons.movie),
          color: theme.colorScheme.primary,
        ),
      final backdrop => Image.network(
          backdrop.url(),
          fit: BoxFit.cover,
        ),
    };

    return LayoutBuilder(
      builder: (context, constrains) {
        final height = constrains.maxHeight;
        const backgroundHeight = 300.0;
        const offset = 20;
        final contentHeight = height - backgroundHeight + offset;
        return Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              height: backgroundHeight,
              child: background,
            ),
            Positioned(
              left: 0,
              top: 0,
              right: 0,
              child: MyAppBar(
                actions: [
                  IconButton(
                    icon: const Icon(Icons.favorite_outline),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              right: 0,
              height: contentHeight,
              child: Material(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(
                      height: 200,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 140,
                            child: Card(
                              child: switch (movieDetails.posterPath) {
                                null => Center(
                                    child: PlaceholderIcon(
                                      icon: const Icon(Icons.movie),
                                      color: theme.colorScheme.primary,
                                    ),
                                  ),
                                final poster => Image.network(
                                    poster.url(),
                                    fit: BoxFit.cover,
                                  ),
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movieDetails.titleAndYear,
                                  style: theme.textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                ),
                                Text(movieDetails.genres.map((e) => e.name).join(', ')),
                                RatingIndicator(rating: movieDetails.voteAverage),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (movieDetails.tagline.isNotEmpty)
                      Center(
                        child: Text(movieDetails.tagline),
                      ),
                    const SizedBox(height: 8),
                    Text(movieDetails.id.toString()),
                    Section(
                      title: const Text('Overview'),
                      content: Text(movieDetails.overview),
                    ),
                    const SizedBox(height: 16),
                    Section(
                      title: const Text('Casts'),
                      content: Carousel(
                        itemCount: movieDetails.casts.length,
                        height: 240,
                        aspectRatio: 9 / 16,
                        itemBuilder: (context, index) {
                          return MovieCastCard(cast: movieDetails.casts[index]);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Section(
                      title: const Text('Crews'),
                      content: Carousel(
                        itemCount: movieDetails.crews.length,
                        height: 240,
                        aspectRatio: 9 / 16,
                        itemBuilder: (context, index) {
                          return MovieCrewCard(crew: movieDetails.crews[index]);
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                    Section(
                      title: const Text('Recommendations'),
                      content: Carousel(
                        itemCount: 10,
                        height: 200,
                        aspectRatio: 16 / 9,
                        itemBuilder: (context, index) {
                          return const Placeholder(
                            fallbackHeight: 200,
                            fallbackWidth: 140,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Loading extends StatelessWidget {
  const _Loading();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

class _Error extends StatelessWidget {
  const _Error({
    required this.error,
  });

  final Object error;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Error: $error'),
    );
  }
}
