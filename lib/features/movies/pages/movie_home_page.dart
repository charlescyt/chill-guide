import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router/router.dart';
import '../../../app/widgets/buttons.dart';
import '../../../app/widgets/carousel.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../app/widgets/section.dart';
import '../../../app/widgets/sliver_sized_box.dart';
import '../../../tmdb/tmdb_options.dart';
import '../../common/widgets/genre_card.dart';
import '../models/movie_genre.dart';
import '../providers/movies_provider.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_landscape_card.dart';

class MovieHomePage extends ConsumerWidget {
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final padding = MediaQuery.paddingOf(context);
    // TODO(charlescyt): Should we let the user choose the time window?
    final trendingMovies = ref.watch(trendingMoviesProvider(timeWindow: TimeWindow.day)).toAsyncValueResults();
    final popularMovies = ref.watch(popularMoviesProvider(page: 1)).toAsyncValueResults();
    final upcomingMovies = ref.watch(upcomingMoviesProvider(page: 1)).toAsyncValueResults();
    final topRatedMovies = ref.watch(topRatedMoviesProvider(page: 1)).toAsyncValueResults();

    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            const MyAppBar(
              title: Text('Movie'),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: SectionTitle(
                      title: Text('Trending Today'),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AsyncValueCarousel(
                      carouselHeight: 240,
                      itemAspectRatio: 14 / 9,
                      asyncItems: trendingMovies,
                      autoPlay: true,
                      itemBuilder: (context, index, movie) => MovieLandscapeCard(
                        movie: movie,
                        onTap: () => MovieDetailsRouteData(movieId: movie.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const MovieCardSkeleton(showSubtitle: false),
                    ),
                  ),
                  const SliverDivider(),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: const Text('Popular'),
                      trailing: SeeAllButton(
                        onPressed: () => const PopularMoviesRouteData().go(context),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AsyncValueCarousel(
                      asyncItems: popularMovies,
                      itemAspectRatio: 5 / 9,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(
                        movie: movie,
                        onTap: () => MovieDetailsRouteData(movieId: movie.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const MovieCardSkeleton(),
                    ),
                  ),
                  const SliverDivider(),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: const Text('Upcoming'),
                      trailing: SeeAllButton(
                        onPressed: () => const UpcomingMoviesRouteData().go(context),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AsyncValueCarousel(
                      itemAspectRatio: 5 / 9,
                      asyncItems: upcomingMovies,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(
                        movie: movie,
                        onTap: () => MovieDetailsRouteData(movieId: movie.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const MovieCardSkeleton(),
                    ),
                  ),
                  const SliverDivider(),
                  SliverToBoxAdapter(
                    child: SectionTitle(
                      title: const Text('Top Rated'),
                      trailing: SeeAllButton(
                        onPressed: () => const TopRatedMoviesRouteData().go(context),
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: AsyncValueCarousel(
                      itemAspectRatio: 5 / 9,
                      asyncItems: topRatedMovies,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(
                        movie: movie,
                        onTap: () => MovieDetailsRouteData(movieId: movie.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const MovieCardSkeleton(),
                    ),
                  ),
                  const SliverDivider(),
                  const SliverToBoxAdapter(
                    child: SectionTitle(
                      title: Text('Grid'),
                    ),
                  ),
                  SliverGrid.builder(
                    itemCount: MovieGenre.values.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 16 / 9,
                    ),
                    itemBuilder: (context, index) {
                      final genre = MovieGenre.values[index];
                      return GenreCard.movie(
                        genre: genre,
                        onTap: () => GenreMoviesRouteData(genreId: genre.tmdbId).go(context),
                      );
                    },
                  ),
                  SliverSizedBox(height: padding.bottom),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
