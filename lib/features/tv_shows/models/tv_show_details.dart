// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/company.dart';
import '../../common/models/genre.dart';
import 'network.dart';
import 'tv_show.dart';
import 'tv_show_cast.dart';
import 'tv_show_season.dart';

export '../../common/models/company.dart';
export '../../common/models/genre.dart';
export 'network.dart';
export 'tv_show.dart';
export 'tv_show_cast.dart';
export 'tv_show_season.dart';

@immutable
class TvShowDetails {
  final int id;
  final String name;
  final String overview;
  final BackdropPath? backdropPath;
  final PosterPath? posterPath;
  final double voteAverage;
  final int voteCount;
  final double popularity;
  final bool inProduction;
  final DateTime? firstAirDate;
  final DateTime? lastAirDate;
  final String tagline;
  final String status;
  final String originalLanguage;
  final String? homepage;
  final String type;
  final List<Genre> genres;
  final int numberOfSeasons;
  final int numberOfEpisodes;
  final List<TvShowSeason> seasons;
  final List<TvShowCast> casts;
  final List<Company> productionCompanies;
  final List<Network> networks;
  final List<TvShow> recommendations;

  String get nameAndYear {
    final year = firstAirDate?.year;
    return year == null ? name : '$name ($year)';
  }

  const TvShowDetails({
    required this.id,
    required this.name,
    required this.overview,
    this.backdropPath,
    this.posterPath,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
    required this.inProduction,
    this.firstAirDate,
    this.lastAirDate,
    required this.tagline,
    required this.status,
    required this.originalLanguage,
    this.homepage,
    required this.type,
    required this.genres,
    required this.numberOfSeasons,
    required this.numberOfEpisodes,
    required this.seasons,
    required this.casts,
    required this.productionCompanies,
    required this.networks,
    required this.recommendations,
  });

  factory TvShowDetails.fromTmdb(Map<String, dynamic> json) {
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
    if (voteAverage is! double) {
      throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'vote_average', 'double', voteAverage));
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
    if (popularity is! double) {
      throw FormatException(buildFormatExceptionMessage('TvShowDetails', 'popularity', 'double', popularity));
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
      throw FormatException(
        buildFormatExceptionMessage('TvShowDetails', 'number_of_episodes', 'int', numberOfEpisodes),
      );
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
      voteAverage: voteAverage,
      voteCount: voteCount,
      popularity: popularity,
      tagline: tagline,
      status: status,
      originalLanguage: originalLanguage,
      homepage: homepage,
      type: type,
      genres: genres.cast<Map<String, dynamic>>().map(Genre.fromTmdb).toList(),
      numberOfSeasons: numberOfSeasons,
      numberOfEpisodes: numberOfEpisodes,
      seasons: seasons.cast<Map<String, dynamic>>().map(TvShowSeason.fromTmdb).toList(),
      casts: casts.cast<Map<String, dynamic>>().map(TvShowCast.fromTmdb).toList(),
      productionCompanies: productionCompanies.cast<Map<String, dynamic>>().map(Company.fromTmdb).toList(),
      networks: networks.cast<Map<String, dynamic>>().map(Network.fromTmdb).toList(),
      recommendations: recommendations.cast<Map<String, dynamic>>().map(TvShow.fromTmdb).toList(),
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'overview: $overview, '
        'backdropPath: $backdropPath, '
        'posterPath: $posterPath, '
        'voteAverage: $voteAverage, '
        'voteCount: $voteCount, '
        'popularity: $popularity, '
        'inProduction: $inProduction, '
        'firstAirDate: $firstAirDate, '
        'lastAirDate: $lastAirDate, '
        'tagline: $tagline, '
        'status: $status, '
        'originalLanguage: $originalLanguage, '
        'homepage: $homepage, '
        'type: $type, '
        'genres: $genres, '
        'numberOfSeasons: $numberOfSeasons, '
        'numberOfEpisodes: $numberOfEpisodes, '
        'seasons: $seasons, '
        'casts: $casts, '
        'productionCompanies: $productionCompanies, '
        'networks: $networks, '
        'recommendations: $recommendations';
  }
}
