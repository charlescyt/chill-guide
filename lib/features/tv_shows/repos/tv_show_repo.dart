import 'package:meta/meta.dart' show immutable;

import '../../../tmdb/tmdb_client.dart';
import '../../../tmdb/tmdb_options.dart';
import '../models/tv_show_details.dart';
import '../models/tv_show_season_details.dart';

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

    return (json['results'] as List).cast<Json>().map(TvShow.fromTmdb).toList();
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

    return (json['results'] as List).cast<Json>().map(TvShow.fromTmdb).toList();
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

    return (json['results'] as List).cast<Json>().map(TvShow.fromTmdb).toList();
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

    return (json['results'] as List).cast<Json>().map(TvShow.fromTmdb).toList();
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

    return (json['results'] as List).cast<Json>().map(TvShow.fromTmdb).toList();
  }

  Future<TvShowDetails> getTvShowDetails({
    required int tvShowId,
    String language = 'en-US',
  }) async {
    final json = await _client.tvShow.getTvShowDetails(
      tvShowId: tvShowId,
      language: language,
    );

    return TvShowDetails.fromTmdb(json);
  }

  Future<TvShowSeasonDetails> getTvShowSeasonDetails({
    required int tvShowId,
    required int seasonNumber,
    String language = 'en-US',
  }) async {
    final json = await _client.tvShow.getTvShowSeasonDetails(
      tvShowId: tvShowId,
      seasonNumber: seasonNumber,
      language: language,
    );

    return TvShowSeasonDetails.fromTmdb(json);
  }
}
