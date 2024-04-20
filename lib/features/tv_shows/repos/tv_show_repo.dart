import 'package:meta/meta.dart' show immutable;

import '../../../app/utils/exception_utils.dart';
import '../../../tmdb/tmdb_client.dart';
import '../../../tmdb/tmdb_options.dart';
import '../models/tv_show.dart';

@immutable
class TvShowRepo {
  final TmdbClient _client;

  const TvShowRepo({
    required TmdbClient client,
  }) : _client = client;

  Future<List<TvShow>> getTrendingTvShows({
    String language = 'en-US',
    TimeWindow timeWindow = TimeWindow.day,
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.tvShow.getTrendingTvShows(
      language: language,
      timeWindow: timeWindow,
    );

    return (json['results'] as List).cast<Json>().map(_toTvShow).toList();
  }

  Future<List<TvShow>> getAiringTodayTvShows({
    int page = 1,
    String language = 'en-US',
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.tvShow.getAiringTodayTvShows(
      page: page,
      language: language,
    );

    return (json['results'] as List).cast<Json>().map(_toTvShow).toList();
  }

  Future<List<TvShow>> getOnTheAirTvShows({
    int page = 1,
    String language = 'en-US',
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.tvShow.getOnTheAirTvShows(
      page: page,
      language: language,
    );

    return (json['results'] as List).cast<Json>().map(_toTvShow).toList();
  }

  Future<List<TvShow>> getPopularTvShows({
    int page = 1,
    String language = 'en-US',
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.tvShow.getPopularTvShows(
      page: page,
      language: language,
    );

    return (json['results'] as List).cast<Json>().map(_toTvShow).toList();
  }

  Future<List<TvShow>> getTopRatedTvShows({
    int page = 1,
    String language = 'en-US',
  }) async {
    await Future<void>.delayed(const Duration(seconds: 3));
    final json = await _client.tvShow.getTopRatedTvShows(
      page: page,
      language: language,
    );

    return (json['results'] as List).cast<Json>().map(_toTvShow).toList();
  }
}

TvShow _toTvShow(Json json) {
  final id = json['id'];
  if (id is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShow', 'id', 'int', id));
  }

  final name = json['name'];
  if (name is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShow', 'name', 'String', name));
  }

  final overview = json['overview'];
  if (overview is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShow', 'overview', 'String', overview));
  }

  final posterPath = json['poster_path'];
  if (posterPath != null && posterPath is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShow', 'poster_path', 'String?', posterPath));
  }
  posterPath as String?;

  final backdropPath = json['backdrop_path'];
  if (backdropPath != null && backdropPath is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShow', 'backdrop_path', 'String?', backdropPath));
  }
  backdropPath as String?;

  final firstAirDate = json['first_air_date'];
  if (firstAirDate != null && firstAirDate is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShow', 'first_air_date', 'String?', firstAirDate));
  }
  firstAirDate as String?;

  final voteAverage = json['vote_average'];
  if (voteAverage is! num) {
    throw FormatException(buildFormatExceptionMessage('TvShow', 'vote_average', 'num', voteAverage));
  }

  final voteCount = json['vote_count'];
  if (voteCount is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShow', 'vote_count', 'int', voteCount));
  }

  final popularity = json['popularity'];
  if (popularity is! num) {
    throw FormatException(buildFormatExceptionMessage('TvShow', 'popularity', 'num', popularity));
  }

  return TvShow(
    id: id,
    name: name,
    overview: overview,
    posterPath: posterPath == null ? null : PosterPath(posterPath),
    backdropPath: backdropPath == null ? null : BackdropPath(backdropPath),
    firstAirDate: firstAirDate == null ? null : DateTime.tryParse(firstAirDate),
    voteAverage: voteAverage.toDouble(),
    voteCount: voteCount,
    popularity: popularity.toDouble(),
  );
}
