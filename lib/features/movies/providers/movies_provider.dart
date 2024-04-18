import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../tmdb/tmdb_client_provider.dart';
import '../../../tmdb/tmdb_options.dart';
import '../../common/utils/riverpod.dart';
import '../models/movie.dart';
import '../repos/movie_repo.dart';

part 'movies_provider.g.dart';

@riverpod
MovieRepo movieRepo(MovieRepoRef ref) {
  final tmdbClient = ref.watch(tmdbClientProvider);
  return MovieRepo(client: tmdbClient);
}

@riverpod
Future<List<Movie>> trendingMovies(
  TrendingMoviesRef ref, {
  TimeWindow timeWindow = TimeWindow.day,
}) async {
  final repo = ref.watch(movieRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final movies = await repo.getTrendingMovies(language: language, timeWindow: timeWindow);
  ref.delayDispose(const Duration(hours: 1));

  return movies;
}

@riverpod
Future<List<Movie>> popularMovies(
  PopularMoviesRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(movieRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final region = ref.watch(tmdbRegionProvider);
  final movies = await repo.getPopularMovies(page: page, language: language, region: region);
  ref.delayDispose(const Duration(hours: 1));

  return movies;
}

@riverpod
Future<List<Movie>> upcomingMovies(
  UpcomingMoviesRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(movieRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final region = ref.watch(tmdbRegionProvider);
  final movies = await repo.getUpcomingMovies(page: page, language: language, region: region);
  ref.delayDispose(const Duration(hours: 1));

  return movies;
}

@riverpod
Future<List<Movie>> topRatedMovies(
  TopRatedMoviesRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(movieRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final region = ref.watch(tmdbRegionProvider);
  final movies = await repo.getTopRatedMovies(page: page, language: language, region: region);
  ref.delayDispose(const Duration(hours: 1));

  return movies;
}
