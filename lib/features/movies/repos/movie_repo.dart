import 'package:meta/meta.dart' show immutable;

import '../../../tmdb/tmdb_client.dart';
import '../../../tmdb/tmdb_options.dart';
import '../../common/models/paginated_response.dart';
import '../models/movie.dart';
import '../models/movie_details.dart';

@immutable
class MovieRepo {
  final TmdbClient _client;

  const MovieRepo({
    required TmdbClient client,
  }) : _client = client;

  Future<List<Movie>> getTrendingMovies({
    String language = 'en-US',
    TimeWindow timeWindow = TimeWindow.day,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.getTrendingMovies(
      language: language,
      timeWindow: timeWindow,
    );

    return PaginatedResponse.fromJson(json).results.map(Movie.fromJson).toList();
  }

  Future<List<Movie>> getPopularMovies({
    int page = 1,
    String language = 'en-US',
    String region = 'US',
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.getPopularMovies(
      page: page,
      language: language,
      region: region,
    );

    return PaginatedResponse.fromJson(json).results.map(Movie.fromJson).toList();
  }

  Future<List<Movie>> getTopRatedMovies({
    int page = 1,
    String language = 'en-US',
    String region = 'US',
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.getTopRatedMovies(
      page: page,
      language: language,
      region: region,
    );

    return PaginatedResponse.fromJson(json).results.map(Movie.fromJson).toList();
  }

  Future<List<Movie>> getUpcomingMovies({
    int page = 1,
    String language = 'en-US',
    String region = 'US',
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.getUpcomingMovies(
      page: page,
      language: language,
      region: region,
    );

    return PaginatedResponse.fromJson(json).results.map(Movie.fromJson).toList();
  }

  Future<MovieDetails> getMovieDetails({
    required int movieId,
    String language = 'en-US',
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.getMovieDetails(
      movieId: movieId,
      language: language,
    );

    return MovieDetails.fromJson(json);
  }
}
