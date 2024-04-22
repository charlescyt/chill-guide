// ignore_for_file: avoid_dynamic_calls

import 'package:meta/meta.dart' show immutable;

import '../../../app/utils/exception_utils.dart';
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

  Future<TvShowDetails> getTvShowDetails({
    required int tvShowId,
    String language = 'en-US',
  }) async {
    final json = await _client.tvShow.getTvShowDetails(
      tvShowId: tvShowId,
      language: language,
    );

    return _toTvShowDetails(json);
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

    return _toTvShowSeasonDetails(json);
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

TvShowDetails _toTvShowDetails(Json json) {
  final id = json['id'];
  if (id is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'id', 'int', id));
  }

  final name = json['name'];
  if (name is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'name', 'String', name));
  }

  final overview = json['overview'];
  if (overview is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'overview', 'String', overview));
  }

  final posterPath = json['poster_path'];
  if (posterPath != null && posterPath is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'poster_path', 'String?', posterPath));
  }
  posterPath as String?;

  final backdropPath = json['backdrop_path'];
  if (backdropPath != null && backdropPath is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'backdrop_path', 'String?', backdropPath));
  }
  backdropPath as String?;

  final firstAirDate = json['first_air_date'];
  if (firstAirDate != null && firstAirDate is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'first_air_date', 'String?', firstAirDate));
  }
  firstAirDate as String?;

  final voteAverage = json['vote_average'];
  if (voteAverage is! num) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'vote_average', 'num', voteAverage));
  }

  final voteCount = json['vote_count'];
  if (voteCount is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'vote_count', 'int', voteCount));
  }

  final inProduction = json['in_production'];
  if (inProduction is! bool) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'in_production', 'bool', inProduction));
  }

  final popularity = json['popularity'];
  if (popularity is! num) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'popularity', 'num', popularity));
  }

  final lastAirDate = json['last_air_date'];
  if (lastAirDate != null && lastAirDate is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'last_air_date', 'String?', lastAirDate));
  }
  lastAirDate as String?;

  final tagline = json['tagline'];
  if (tagline is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'tagline', 'String', tagline));
  }

  final status = json['status'];
  if (status is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'status', 'String', status));
  }

  final originalLanguage = json['original_language'];
  if (originalLanguage is! String) {
    throw FormatException(
      buildFormatExceptionMessage('TvShowDetails', 'original_language', 'String', originalLanguage),
    );
  }

  final homepage = json['homepage'];
  if (homepage != null && homepage is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'homepage', 'String?', homepage));
  }
  homepage as String?;

  final type = json['type'];
  if (type is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'type', 'String', type));
  }

  final genres = json['genres'];
  if (genres is! List) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'genres', 'List', genres));
  }

  final numberOfSeasons = json['number_of_seasons'];
  if (numberOfSeasons is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'number_of_seasons', 'int', numberOfSeasons));
  }

  final numberOfEpisodes = json['number_of_episodes'];
  if (numberOfEpisodes is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'number_of_episodes', 'int', numberOfEpisodes));
  }

  final seasons = json['seasons'];
  if (seasons is! List) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'seasons', 'List', seasons));
  }

  final casts = json['credits']['cast'];
  if (casts is! List) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'casts', 'List', casts));
  }

  final productionCompanies = json['production_companies'];
  if (productionCompanies is! List) {
    throw FormatException(
      buildFormatExceptionMessage('TvShowDetails', 'production_companies', 'List', productionCompanies),
    );
  }

  final networks = json['networks'];
  if (networks is! List) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'networks', 'List', networks));
  }

  final recommendations = json['recommendations']['results'];
  if (recommendations is! List) {
    throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'recommendations', 'List', recommendations));
  }

  return TvShowDetails(
    id: id,
    name: name,
    overview: overview,
    posterPath: posterPath == null ? null : PosterPath(posterPath),
    backdropPath: backdropPath == null ? null : BackdropPath(backdropPath),
    inProduction: inProduction,
    firstAirDate: firstAirDate == null ? null : DateTime.tryParse(firstAirDate),
    lastAirDate: lastAirDate == null ? null : DateTime.tryParse(lastAirDate),
    voteAverage: voteAverage.toDouble(),
    voteCount: voteCount,
    popularity: popularity.toDouble(),
    tagline: tagline,
    status: status,
    originalLanguage: originalLanguage,
    homepage: homepage,
    type: type,
    genres: genres.cast<Map<String, dynamic>>().map(Genre.fromJson).toList(),
    numberOfSeasons: numberOfSeasons,
    numberOfEpisodes: numberOfEpisodes,
    seasons: seasons.cast<Map<String, dynamic>>().map(_toTvShowSeason).toList(),
    casts: casts.cast<Map<String, dynamic>>().map(_toTvShowCast).toList(),
    productionCompanies: productionCompanies.cast<Map<String, dynamic>>().map(Company.fromTmdb).toList(),
    networks: networks.cast<Map<String, dynamic>>().map(Network.fromTmdb).toList(),
    recommendations: recommendations.cast<Map<String, dynamic>>().map(_toTvShow).toList(),
  );
}

TvShowCast _toTvShowCast(Json json) {
  final id = json['id'];
  if (id is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowCast', 'id', 'int', id));
  }

  final name = json['name'];
  if (name is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowCast', 'name', 'String', name));
  }

  final profilePath = json['profile_path'];
  if (profilePath != null && profilePath is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowCast', 'profile_path', 'String?', profilePath));
  }
  profilePath as String?;

  final popularity = json['popularity'];
  if (popularity is! num) {
    throw FormatException(buildFormatExceptionMessage('TvShowCast', 'popularity', 'num', popularity));
  }

  final character = json['character'];
  if (character is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowCast', 'character', 'String', character));
  }

  return TvShowCast(
    id: id,
    name: name,
    profilePath: profilePath == null ? null : ProfilePath(profilePath),
    popularity: popularity.toDouble(),
    character: character,
  );
}

TvShowSeason _toTvShowSeason(Json json) {
  final id = json['id'];
  if (id is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeason', 'id', 'int', id));
  }

  final name = json['name'];
  if (name is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeason', 'name', 'String', name));
  }

  final seasonNumber = json['season_number'];
  if (seasonNumber is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeason', 'season_number', 'int', seasonNumber));
  }

  final episodeCount = json['episode_count'];
  if (episodeCount is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeason', 'episode_count', 'int', episodeCount));
  }

  final overview = json['overview'];
  if (overview is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeason', 'overview', 'String', overview));
  }

  final posterPath = json['poster_path'];
  if (posterPath != null && posterPath is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeason', 'poster_path', 'String?', posterPath));
  }
  posterPath as String?;

  final airDate = json['air_date'];
  if (airDate != null && airDate is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeason', 'air_date', 'String?', airDate));
  }
  airDate as String?;

  final voteAverage = json['vote_average'];
  if (voteAverage is! num) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeason', 'vote_average', 'num', voteAverage));
  }

  return TvShowSeason(
    id: id,
    name: name,
    seasonNumber: seasonNumber,
    episodeCount: episodeCount,
    overview: overview,
    posterPath: posterPath == null ? null : PosterPath(posterPath),
    airDate: airDate == null ? null : DateTime.tryParse(airDate),
    voteAverage: voteAverage.toDouble(),
  );
}

TvShowSeasonDetails _toTvShowSeasonDetails(Json json) {
  final id = json['id'];
  if (id is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'id', 'int', id));
  }

  final name = json['name'];
  if (name is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'name', 'String', name));
  }

  final seasonNumber = json['season_number'];
  if (seasonNumber is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'season_number', 'int', seasonNumber));
  }

  final overview = json['overview'];
  if (overview is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'overview', 'String', overview));
  }

  final posterPath = json['poster_path'];
  if (posterPath != null && posterPath is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'poster_path', 'String?', posterPath));
  }
  posterPath as String?;

  final airDate = json['air_date'];
  if (airDate != null && airDate is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'air_date', 'String?', airDate));
  }
  airDate as String?;

  final voteAverage = json['vote_average'];
  if (voteAverage is! num) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'vote_average', 'num', voteAverage));
  }

  final episodes = json['episodes'];
  if (episodes is! List) {
    throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'episodes', 'List', episodes));
  }

  return TvShowSeasonDetails(
    id: id,
    name: name,
    seasonNumber: seasonNumber,
    overview: overview,
    posterPath: posterPath == null ? null : PosterPath(posterPath),
    airDate: airDate == null ? null : DateTime.tryParse(airDate),
    voteAverage: voteAverage.toDouble(),
    episodes: episodes.cast<Json>().map(_toTvShowEpisode).toList(),
  );
}

TvShowEpisode _toTvShowEpisode(Json json) {
  final id = json['id'];
  if (id is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'id', 'int', id));
  }

  final name = json['name'];
  if (name is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'name', 'String', name));
  }

  final episodeNumber = json['episode_number'];
  if (episodeNumber is! int) {
    throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'episode_number', 'int', episodeNumber));
  }

  final overview = json['overview'];
  if (overview is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'overview', 'String', overview));
  }

  final stillPath = json['still_path'];
  if (stillPath != null && stillPath is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'still_path', 'String?', stillPath));
  }
  stillPath as String?;

  final airDate = json['air_date'];
  if (airDate != null && airDate is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'air_date', 'String?', airDate));
  }
  airDate as String?;

  final voteAverage = json['vote_average'];
  if (voteAverage is! num) {
    throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'vote_average', 'num', voteAverage));
  }

  final voteCount = json['vote_count'];
  if (voteCount is! num) {
    throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'vote_count', 'int', voteCount));
  }

  final runtime = json['runtime'];
  if (runtime != null && runtime is! num) {
    throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'runtime', 'int', runtime));
  }
  runtime as num?;

  final episodeType = json['episode_type'];
  if (episodeType is! String) {
    throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'episode_type', 'String', episodeType));
  }

  return TvShowEpisode(
    id: id,
    name: name,
    episodeNumber: episodeNumber,
    overview: overview,
    stillPath: stillPath == null ? null : StillPath(stillPath),
    airDate: airDate == null ? null : DateTime.tryParse(airDate),
    voteAverage: voteAverage.toDouble(),
    voteCount: voteCount.toDouble(),
    runtime: runtime?.toInt(),
    episodeType: episodeType,
  );
}
