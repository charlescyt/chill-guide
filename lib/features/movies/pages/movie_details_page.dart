import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router/router.dart';
import '../../../app/utils/formatting.dart';
import '../../../app/widgets/carousel.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../../../app/widgets/rating_indicator.dart';
import '../../../app/widgets/section.dart';
import '../../common/widgets/company_list_tile.dart';
import '../models/movie_details.dart';
import '../providers/movies_provider.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_cast_card.dart';
import '../widgets/movie_crew_card.dart';

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
    final bottom = MediaQuery.viewPaddingOf(context).bottom;

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

    return Stack(
      fit: StackFit.expand,
      children: [
        if (movieDetails.posterPath case final posterPath?)
          ImageFiltered(
            imageFilter: ui.ImageFilter.blur(sigmaX: 4, sigmaY: 4),
            child: Image.network(
              posterPath.url(),
              fit: BoxFit.cover,
            ),
          ),
        DecoratedBox(
          decoration: BoxDecoration(
            color: theme.colorScheme.background.withOpacity(0.5),
          ),
        ),
        Column(
          children: [
            MyAppBar(
              background: ClipRRect(
                borderRadius: const BorderRadius.vertical(bottom: Radius.circular(24)),
                child: background,
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.favorite_outline),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 8),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(left: 8, right: 8, bottom: bottom),
                child: Column(
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
                          const SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movieDetails.titleAndYear,
                                  style: theme.textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 2,
                                ),
                                Text(formatRuntime(movieDetails.runtime)),
                                Text(movieDetails.genres.map((e) => e.name).join(', ')),
                                RatingIndicator(rating: movieDetails.voteAverage),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (movieDetails.tagline case final tagline when tagline.isNotEmpty)
                      Center(
                        child: Text(
                          tagline,
                          style: theme.textTheme.bodyMedium?.copyWith(fontStyle: FontStyle.italic),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    const Divider(),
                    Section(
                      title: const Text('Overview'),
                      content: Text(movieDetails.overview),
                    ),
                    if (movieDetails.budget case final budget when budget > 0) ...[
                      const Divider(),
                      Section(
                        title: const Text('Budget'),
                        content: Text(formatCurrency(budget)),
                      ),
                    ],
                    if (movieDetails.revenue case final revenue when revenue > 0) ...[
                      const Divider(),
                      Section(
                        title: const Text('Revenue'),
                        content: Text(formatCurrency(revenue)),
                      ),
                    ],
                    if (movieDetails.productionCompanies case final companies when companies.isNotEmpty) ...[
                      const Divider(),
                      Section(
                        title: const Text('Production Companies'),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final company in companies) //
                              CompanyListTile(company: company),
                          ],
                        ),
                      ),
                    ],
                    if (movieDetails.casts case final casts when casts.isNotEmpty) ...[
                      const Divider(),
                      Section(
                        title: const Text('Casts'),
                        content: Carousel(
                          itemCount: casts.length,
                          height: 240,
                          aspectRatio: 9 / 16,
                          itemBuilder: (context, index) {
                            final cast = casts[index];
                            return MovieCastCard(
                              cast: cast,
                              onTap: () {
                                // TODO(charlescyt): Push to cast details page
                              },
                            );
                          },
                        ),
                      ),
                    ],
                    if (movieDetails.crews case final crews when crews.isNotEmpty) ...[
                      const Divider(),
                      Section(
                        title: const Text('Crews'),
                        content: Carousel(
                          itemCount: crews.length,
                          height: 240,
                          aspectRatio: 9 / 16,
                          itemBuilder: (context, index) {
                            final crew = crews[index];
                            return MovieCrewCard(
                              crew: crew,
                              onTap: () {
                                // TODO(charlescyt): Push to crew details page
                              },
                            );
                          },
                        ),
                      ),
                    ],
                    if (movieDetails.recommendations case final recommendations when recommendations.isNotEmpty) ...[
                      const Divider(),
                      Section(
                        title: const Text('Recommendations'),
                        content: Carousel(
                          itemCount: recommendations.length,
                          height: 240,
                          aspectRatio: 9 / 16,
                          itemBuilder: (context, index) {
                            final movie = recommendations[index];
                            return MovieCard(
                              movie: movie,
                              onTap: () => MovieDetailsRouteData(movieId: movie.id).push<void>(context),
                            );
                          },
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
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
