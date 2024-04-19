import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/router/router.dart';
import '../../../app/widgets/carousel.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../../../tmdb/tmdb_options.dart';
import '../providers/movies_provider.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_landscape_card.dart';

class MovieHomePage extends ConsumerWidget {
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO(charlescyt): Should we let the user choose the time window?
    final trendingMovies = ref.watch(trendingMoviesProvider(timeWindow: TimeWindow.day));
    final popularMovies = ref.watch(popularMoviesProvider(page: 1));
    final upcomingMovies = ref.watch(upcomingMoviesProvider(page: 1));
    final topRatedMovies = ref.watch(topRatedMoviesProvider(page: 1));

    return SizedBox.expand(
      child: Material(
        child: Column(
          children: [
            const MyAppBar(
              title: Text('Movie Home Page'),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CarouselSection(
                      title: const Text('Trending Movies'),
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
                    CarouselSection(
                      title: const Text('Popular Movies'),
                      asyncItems: popularMovies,
                      itemAspectRatio: 5 / 9,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(
                        movie: movie,
                        onTap: () => MovieDetailsRouteData(movieId: movie.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const MovieCardSkeleton(),
                    ),
                    CarouselSection(
                      title: const Text('Upcoming Movies'),
                      itemAspectRatio: 5 / 9,
                      asyncItems: upcomingMovies,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(
                        movie: movie,
                        onTap: () => MovieDetailsRouteData(movieId: movie.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const MovieCardSkeleton(),
                    ),
                    CarouselSection(
                      title: const Text('Top Rated Movies'),
                      itemAspectRatio: 5 / 9,
                      asyncItems: topRatedMovies,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(
                        movie: movie,
                        onTap: () => MovieDetailsRouteData(movieId: movie.id).go(context),
                      ),
                      loadingBuilder: (context, index) => const MovieCardSkeleton(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
