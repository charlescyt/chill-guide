import 'dart:convert' show jsonDecode, utf8;

import 'package:http/http.dart' as http;
import 'package:meta/meta.dart' show immutable;

import 'tmdb_constants.dart';
import 'tmdb_options.dart';

typedef Json = Map<String, dynamic>;
typedef QueryParameters = Map<String, dynamic>;

@immutable
class TmdbClient {
  final http.Client _client;
  final String _token;
  late final TvShowEndpoint tvShow;

  TmdbClient({
    http.Client? client,
    required String token,
  })  : _client = client ?? http.Client(),
        _token = token {
    tvShow = TvShowEndpoint(this);
  }

  Future<Json> getTrendingMovies({
    String language = 'en-US',
    TimeWindow timeWindow = TimeWindow.day,
  }) async {
    final endpoint = '${TmdbConstants.trendingMovies}/${timeWindow.name}';
    final queryParameters = {
      'language': language,
    };
    final json = await _get(endpoint, queryParameters: queryParameters);

    return json;
  }

  Future<Json> getPopularMovies({
    int page = 1,
    String language = 'en-US',
    String region = 'US',
  }) async {
    final queryParameters = {
      'page': '$page',
      'language': language,
      'region': region,
    };
    final json = await _get(TmdbConstants.popularMovies, queryParameters: queryParameters);

    return json;
  }

  Future<Json> getUpcomingMovies({
    int page = 1,
    String language = 'en-US',
    String region = 'US',
  }) async {
    final queryParameters = {
      'page': '$page',
      'language': language,
      'region': region,
    };
    final json = await _get(TmdbConstants.upcomingMovies, queryParameters: queryParameters);

    return json;
  }

  Future<Json> getTopRatedMovies({
    int page = 1,
    String language = 'en-US',
    String region = 'US',
  }) async {
    final queryParameters = {
      'page': '$page',
      'language': language,
      'region': region,
    };
    final json = await _get(TmdbConstants.topRatedMovies, queryParameters: queryParameters);

    return json;
  }

  Future<Json> discoverMovies({
    int page = 1,
    String language = 'en-US',
    String region = 'US',
    required Map<String, dynamic> filters,
  }) async {
    final queryParameters = {
      'page': '$page',
      'language': language,
      'region': region,
      ...filters,
    };
    final json = await _get(TmdbConstants.discoverMovies, queryParameters: queryParameters);

    return json;
  }

  Future<Json> getMovieDetails({
    required int movieId,
    String language = 'en-US',
  }) async {
    final endpoint = '${TmdbConstants.movieDetails}/$movieId';
    final queryParameters = {
      'language': language,
      'append_to_response': 'credits,recommendations',
    };
    final json = await _get(endpoint, queryParameters: queryParameters);

    return json;
  }

  Future<Json> _get(
    String endpoint, {
    QueryParameters? queryParameters,
  }) async {
    final uri = Uri.https(
      TmdbConstants.apiHost,
      '${TmdbConstants.apiPath}$endpoint',
      queryParameters,
    );
    final response = await _client.get(
      uri,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token',
      },
    );

    final json = jsonDecode(utf8.decode(response.bodyBytes)) as Json;

    return json;
  }
}

class TvShowEndpoint {
  final TmdbClient _client;

  const TvShowEndpoint(this._client);

  Future<Json> getTrendingTvShows({
    String language = 'en-US',
    TimeWindow timeWindow = TimeWindow.day,
  }) async {
    final endpoint = '${TmdbConstants.trendingTvShows}/${timeWindow.name}';
    final queryParameters = {
      'language': language,
    };
    final json = await _client._get(endpoint, queryParameters: queryParameters);

    return json;
  }

  Future<Json> getAiringTodayTvShows({
    int page = 1,
    String language = 'en-US',
  }) async {
    final queryParameters = {
      'page': '$page',
      'language': language,
    };
    final json = await _client._get(TmdbConstants.airingTodayTvShows, queryParameters: queryParameters);

    return json;
  }

  Future<Json> getOnTheAirTvShows({
    int page = 1,
    String language = 'en-US',
  }) async {
    final queryParameters = {
      'page': '$page',
      'language': language,
    };
    final json = await _client._get(TmdbConstants.onTheAirTvShows, queryParameters: queryParameters);

    return json;
  }

  Future<Json> getPopularTvShows({
    int page = 1,
    String language = 'en-US',
  }) async {
    final queryParameters = {
      'page': '$page',
      'language': language,
    };
    final json = await _client._get(TmdbConstants.popularTvShows, queryParameters: queryParameters);

    return json;
  }

  Future<Json> getTopRatedTvShows({
    int page = 1,
    String language = 'en-US',
  }) async {
    final queryParameters = {
      'page': '$page',
      'language': language,
    };
    final json = await _client._get(TmdbConstants.topRatedTvShows, queryParameters: queryParameters);

    return json;
  }

  Future<Json> discoverTvShows({
    int page = 1,
    String language = 'en-US',
    String region = 'US',
    required Map<String, dynamic> filters,
  }) async {
    final queryParameters = {
      'page': '$page',
      'language': language,
      'region': region,
      ...filters,
    };
    final json = await _client._get(TmdbConstants.discoverTvShows, queryParameters: queryParameters);

    return json;
  }

  Future<Json> getTvShowDetails({
    required int tvShowId,
    String language = 'en-US',
  }) async {
    final endpoint = '${TmdbConstants.tvShowDetails}/$tvShowId';
    final queryParameters = {
      'language': language,
      'append_to_response': 'credits,recommendations',
    };
    final json = await _client._get(endpoint, queryParameters: queryParameters);

    return json;
  }

  Future<Json> getTvShowSeasonDetails({
    required int tvShowId,
    required int seasonNumber,
    String language = 'en-US',
  }) async {
    final endpoint = TmdbConstants.tvShowSeasonDetails
        .replaceFirst('{id}', '$tvShowId')
        .replaceFirst('{season_number}', '$seasonNumber');
    final queryParameters = {
      'language': language,
      'append_to_response': 'credits',
    };
    final json = await _client._get(endpoint, queryParameters: queryParameters);

    return json;
  }
}
