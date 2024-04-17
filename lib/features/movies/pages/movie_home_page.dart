import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../app/widgets/carousel.dart';
import '../../../app/widgets/my_app_bar.dart';
import '../models/movie.dart';
import '../providers/movies_provider.dart';

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
                      itemBuilder: (context, index, movie) => MovieCard(
                        movie: movie,
                        color: Colors.primaries[(index - 5) % Colors.primaries.length],
                      ),
                      loadingBuilder: (context, index) => const MovieSkeletonCard(),
                    ),
                    CarouselSection(
                      title: const Text('Popular Movies'),
                      asyncItems: popularMovies,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(
                        movie: movie,
                        color: Colors.primaries[itemIndex % Colors.primaries.length],
                      ),
                      loadingBuilder: (context, index) => const MovieSkeletonCard(),
                    ),
                    CarouselSection(
                      title: const Text('Upcoming Movies'),
                      asyncItems: popularMovies,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(
                        movie: movie,
                        color: Colors.primaries[(itemIndex + 5) % Colors.primaries.length],
                      ),
                      loadingBuilder: (context, index) => const MovieSkeletonCard(),
                    ),
                    CarouselSection(
                      title: const Text('Top Rated Movies'),
                      asyncItems: popularMovies,
                      itemBuilder: (context, itemIndex, movie) => MovieCard(
                        movie: movie,
                        color: Colors.primaries[(itemIndex + 10) % Colors.primaries.length],
                      ),
                      loadingBuilder: (context, index) => const MovieSkeletonCard(),
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

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
    required this.movie,
    required this.color,
  });

  final Movie movie;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      child: Center(
        child: Text(
          movie.title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class MovieSkeletonCard extends StatelessWidget {
  const MovieSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Skeletonizer.zone(
      child: Card(
        child: SizedBox.expand(
          child: Bone(),
        ),
      ),
    );
  }
}
