import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'movie.dart';

part 'movies_provider.g.dart';

@riverpod
Future<List<Movie>> popularMovies(PopularMoviesRef ref) async {
  await Future<void>.delayed(const Duration(seconds: 3));

  return [
    const Movie(title: 'The Shawshank Redemption'),
    const Movie(title: 'The Godfather'),
    const Movie(title: 'The Dark Knight'),
    const Movie(title: 'The Godfather Part II'),
    const Movie(title: '12 Angry Men'),
    const Movie(title: "Schindler's List"),
    const Movie(title: 'The Lord of the Rings: The Return of the King'),
    const Movie(title: 'Pulp Fiction'),
    const Movie(title: 'The Good, the Bad and the Ugly'),
    const Movie(title: 'Fight Club'),
  ];
}
