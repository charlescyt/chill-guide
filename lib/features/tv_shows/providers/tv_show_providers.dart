import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../tmdb/tmdb_client_provider.dart';
import '../../../tmdb/tmdb_options.dart';
import '../../common/utils/riverpod.dart';
import '../models/tv_show.dart';
import '../models/tv_show_details.dart';
import '../repos/tv_show_repo.dart';

part 'tv_show_providers.g.dart';

@riverpod
TvShowRepo tvShowRepo(TvShowRepoRef ref) {
  final tmdbClient = ref.watch(tmdbClientProvider);
  return TvShowRepo(client: tmdbClient);
}

@riverpod
Future<List<TvShow>> trendingTvShows(
  TrendingTvShowsRef ref, {
  TimeWindow timeWindow = TimeWindow.day,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final tvShows = await repo.getTrendingTvShows(language: language, timeWindow: timeWindow);
  ref.delayDispose(const Duration(hours: 1));

  return tvShows;
}

@riverpod
Future<List<TvShow>> airingTodayTvShows(
  AiringTodayTvShowsRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final tvShows = await repo.getAiringTodayTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return tvShows;
}

@riverpod
Future<List<TvShow>> onTheAirTvShows(
  OnTheAirTvShowsRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final tvShows = await repo.getOnTheAirTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return tvShows;
}

@riverpod
Future<List<TvShow>> popularTvShows(
  PopularTvShowsRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final tvShows = await repo.getPopularTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return tvShows;
}

@riverpod
Future<List<TvShow>> topRatedTvShows(
  TopRatedTvShowsRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final tvShows = await repo.getTopRatedTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return tvShows;
}

@riverpod
Future<TvShowDetails> tvShowDetails(
  TvShowDetailsRef ref, {
  required int tvShowId,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final tvShow = await repo.getTvShowDetails(tvShowId: tvShowId, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return tvShow;
}
