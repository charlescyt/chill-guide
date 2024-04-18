import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app/widgets/carousel.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../providers/movies_provider.dart';
import '../widgets/movie_card.dart';
import '../widgets/movie_landscape_card.dart';

class MovieHomePage extends ConsumerWidget {
  const MovieHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final popularMovies = ref.watch(popularMoviesProvider);

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
                    TopCarousel(
                      height: 200,
                      asyncItems: popularMovies,
                      itemBuilder: (context, index, movie) => MovieLandscapeCard(movie: movie),
                      loadingBuilder: (context, index) => const MovieLandscapeCardSkeleton(),
                    ),
                    CarouselSection(
                      title: const Text('Popular Movies'),
                      asyncItems: popularMovies,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(movie: movie),
                      loadingBuilder: (context, index) => const MovieCardSkeleton(),
                    ),
                    CarouselSection(
                      title: const Text('Upcoming Movies'),
                      asyncItems: popularMovies,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(movie: movie),
                      loadingBuilder: (context, index) => const MovieCardSkeleton(),
                    ),
                    CarouselSection(
                      title: const Text('Top Rated Movies'),
                      asyncItems: popularMovies,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(movie: movie),
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
