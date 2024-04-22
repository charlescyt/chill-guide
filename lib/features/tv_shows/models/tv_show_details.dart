import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../common/models/genre.dart';
import 'tv_show.dart';
import 'tv_show_cast.dart';
import 'tv_show_season.dart';

export '../../common/models/genre.dart';
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
    required this.recommendations,
  });

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
        'recommendations: $recommendations';
  }
}
