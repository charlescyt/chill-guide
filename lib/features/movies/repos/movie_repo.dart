import 'package:meta/meta.dart' show immutable;

import '../../../tmdb/tmdb_client.dart';
import '../../../tmdb/tmdb_options.dart';
import '../../common/models/paginated_response.dart';
import '../models/movie_details.dart';

@immutable
class MovieRepo {
  final TmdbClient _client;

  const MovieRepo({
    required TmdbClient client,
  }) : _client = client;

  Future<PaginatedResponse<Movie>> getTrendingMovies({
    String language = 'en-US',
    TimeWindow timeWindow = TimeWindow.day,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.getTrendingMovies(
      language: language,
      timeWindow: timeWindow,
    );

    return PaginatedResponse.fromTmdb(json, Movie.fromTmdb);
  }

  Future<PaginatedResponse<Movie>> getPopularMovies({
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

    return PaginatedResponse.fromTmdb(json, Movie.fromTmdb);
  }

  Future<PaginatedResponse<Movie>> getTopRatedMovies({
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

    return PaginatedResponse.fromTmdb(json, Movie.fromTmdb);
  }

  Future<PaginatedResponse<Movie>> getUpcomingMovies({
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

    return PaginatedResponse.fromTmdb(json, Movie.fromTmdb);
  }

  Future<PaginatedResponse<Movie>> discoverMoviesWithGenre({
    required int genreId,
    int page = 1,
    String language = 'en-US',
    String region = 'US',
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.discoverMovies(
      page: page,
      language: language,
      region: region,
      filters: {
        'with_genres': '$genreId',
        'sort_by': 'popularity.desc',
      },
    );

    return PaginatedResponse.fromTmdb(json, Movie.fromTmdb);
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

    return MovieDetails.fromTmdb(json);
  }
}
