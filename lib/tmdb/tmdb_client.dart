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

  TmdbClient({
    http.Client? client,
    required String token,
  })  : _client = client ?? http.Client(),
        _token = token;

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