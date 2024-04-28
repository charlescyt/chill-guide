import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../tmdb/tmdb_client_provider.dart';
import '../../../tmdb/tmdb_options.dart';
import '../../common/models/paginated_response.dart';
import '../../common/utils/riverpod.dart';
import '../models/movie_details.dart';
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
  final response = await repo.getTrendingMovies(language: language, timeWindow: timeWindow);
  ref.delayDispose(const Duration(hours: 1));

  return response.results;
}

@riverpod
Future<PaginatedResponse<Movie>> popularMoviesResponse(
  PopularMoviesResponseRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(movieRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final region = ref.watch(tmdbRegionProvider);
  final response = await repo.getPopularMovies(page: page, language: language, region: region);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<List<Movie>> popularMovies(
  PopularMoviesRef ref, {
  int page = 1,
}) async {
  final response = await ref.watch(popularMoviesResponseProvider(page: page).future);
  ref.delayDispose(const Duration(hours: 1));

  return response.results;
}

@riverpod
Future<PaginatedResponse<Movie>> upcomingMoviesResponse(
  UpcomingMoviesResponseRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(movieRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final region = ref.watch(tmdbRegionProvider);
  final response = await repo.getUpcomingMovies(page: page, language: language, region: region);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<List<Movie>> upcomingMovies(
  UpcomingMoviesRef ref, {
  int page = 1,
}) async {
  final response = await ref.watch(upcomingMoviesResponseProvider(page: page).future);
  ref.delayDispose(const Duration(hours: 1));

  return response.results;
}

@riverpod
Future<PaginatedResponse<Movie>> topRatedMoviesResponse(
  TopRatedMoviesResponseRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(movieRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final region = ref.watch(tmdbRegionProvider);
  final response = await repo.getTopRatedMovies(page: page, language: language, region: region);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<List<Movie>> topRatedMovies(
  TopRatedMoviesRef ref, {
  int page = 1,
}) async {
  final response = await ref.watch(topRatedMoviesResponseProvider(page: page).future);
  ref.delayDispose(const Duration(hours: 1));

  return response.results;
}

@riverpod
Future<MovieDetails> movieDetails(
  MovieDetailsRef ref, {
  required int movieId,
}) async {
  final repo = ref.watch(movieRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final details = await repo.getMovieDetails(movieId: movieId, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return details;
}
