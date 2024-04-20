import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../common/models/backdrop_path.dart';
import '../../common/models/poster_path.dart';

export '../../common/models/backdrop_path.dart';
export '../../common/models/poster_path.dart';

@immutable
class TvShow {
  final int id;
  final String name;
  final String overview;
  final PosterPath? posterPath;
  final BackdropPath? backdropPath;
  final DateTime? firstAirDate;
  final double voteAverage;
  final int voteCount;
  final double popularity;

  String get nameAndFirstAirYear {
    final year = firstAirDate?.year;
    return year == null ? name : '$name ($year)';
  }

  const TvShow({
    required this.id,
    required this.name,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
  });

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'overview: $overview, '
        'posterPath: $posterPath, '
        'backdropPath: $backdropPath, '
        'firstAirDate: $firstAirDate, '
        'voteAverage: $voteAverage, '
        'voteCount: $voteCount, '
        'popularity: $popularity';
  }
}
