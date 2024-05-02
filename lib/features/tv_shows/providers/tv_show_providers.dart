import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../tmdb/tmdb_client_provider.dart';
import '../../../tmdb/tmdb_options.dart';
import '../../common/models/paginated_response.dart';
import '../../common/utils/riverpod.dart';
import '../models/tv_show_details.dart';
import '../models/tv_show_season_details.dart';
import '../repos/tv_show_repo.dart';

export '../../common/models/paginated_response.dart';
export '../models/tv_show_details.dart';
export '../models/tv_show_season_details.dart';

part 'tv_show_providers.g.dart';

@riverpod
TvShowRepo tvShowRepo(TvShowRepoRef ref) {
  final tmdbClient = ref.watch(tmdbClientProvider);
  return TvShowRepo(client: tmdbClient);
}

@riverpod
Future<PaginatedResponse<TvShow>> trendingTvShows(
  TrendingTvShowsRef ref, {
  TimeWindow timeWindow = TimeWindow.day,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final response = await repo.getTrendingTvShows(language: language, timeWindow: timeWindow);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<PaginatedResponse<TvShow>> airingTodayTvShows(
  AiringTodayTvShowsRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final response = await repo.getAiringTodayTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<PaginatedResponse<TvShow>> onTheAirTvShows(
  OnTheAirTvShowsRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final response = await repo.getOnTheAirTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<PaginatedResponse<TvShow>> popularTvShows(
  PopularTvShowsRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final response = await repo.getPopularTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<PaginatedResponse<TvShow>> topRatedTvShows(
  TopRatedTvShowsRef ref, {
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final response = await repo.getTopRatedTvShows(page: page, language: language);
  ref.delayDispose(const Duration(hours: 1));

  return response;
}

@riverpod
Future<PaginatedResponse<TvShow>> discoverTvShowsWithGenre(
  DiscoverTvShowsWithGenreRef ref, {
  required int genreId,
  int page = 1,
}) async {
  final repo = ref.watch(tvShowRepoProvider);
  final language = ref.watch(tmdbLanguageProvider);
  final region = ref.watch(tmdbRegionProvider);
  final response = await repo.discoverTvShowsWithGenre(
    genreId: genreId,
    page: page,
    region: region,
    language: language,
  );
  ref.delayDispose(const Duration(hours: 1));

  return response;
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
