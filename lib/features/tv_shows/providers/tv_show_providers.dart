import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../tmdb/tmdb_client_provider.dart';
import '../../../tmdb/tmdb_options.dart';
import '../../common/models/paginated_response.dart';
import '../../common/utils/riverpod.dart';
import '../models/tv_show_details.dart';
import '../models/tv_show_season_details.dart';
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
  final response = await repo.getTrendingTvShows(language: language, timeWindow: timeWindow);
  ref.delayDispose(const Duration(hours: 1));

  return response.results;
}

@riverpod
Future<PaginatedResponse<TvShow>> airingTodayTvShowsResponse(
  AiringTodayTvShowsResponseRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final response = await repo.getAiringTodayTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<List<TvShow>> airingTodayTvShows(
  AiringTodayTvShowsRef ref, {
  int page = 1,
}) async {
  final response = await ref.watch(airingTodayTvShowsResponseProvider(page: page).future);
  ref.delayDispose(const Duration(hours: 1));

  return response.results;
}

@riverpod
Future<PaginatedResponse<TvShow>> onTheAirTvShowsResponse(
  OnTheAirTvShowsResponseRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final response = await repo.getOnTheAirTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<List<TvShow>> onTheAirTvShows(
  OnTheAirTvShowsRef ref, {
  int page = 1,
}) async {
  final response = await ref.watch(onTheAirTvShowsResponseProvider(page: page).future);
  ref.delayDispose(const Duration(hours: 1));

  return response.results;
}

@riverpod
Future<PaginatedResponse<TvShow>> popularTvShowsResponse(
  PopularTvShowsResponseRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final response = await repo.getPopularTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<List<TvShow>> popularTvShows(
  PopularTvShowsRef ref, {
  int page = 1,
}) async {
  final response = await ref.watch(popularTvShowsResponseProvider(page: page).future);
  ref.delayDispose(const Duration(hours: 1));

  return response.results;
}

@riverpod
Future<PaginatedResponse<TvShow>> topRatedTvShowsResponse(
  TopRatedTvShowsResponseRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final response = await repo.getTopRatedTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<List<TvShow>> topRatedTvShows(
  TopRatedTvShowsRef ref, {
  int page = 1,
}) async {
  final response = await ref.watch(topRatedTvShowsResponseProvider(page: page).future);
  ref.delayDispose(const Duration(hours: 1));

  return response.results;
}

@riverpod
Future<TvShowDetails> tvShowDetails(
  TvShowDetailsRef ref, {
  required int tvShowId,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final details = await repo.getTvShowDetails(tvShowId: tvShowId, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return details;
}

@riverpod
Future<TvShowSeasonDetails> tvShowSeasonDetails(
  TvShowSeasonDetailsRef ref, {
  required int tvShowId,
  required int seasonNumber,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final seasonDetails =
      await repo.getTvShowSeasonDetails(tvShowId: tvShowId, seasonNumber: seasonNumber, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return seasonDetails;
}
