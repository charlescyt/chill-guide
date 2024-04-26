import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

@immutable
class TvShowSeason {
  final int id;
  final String name;
  final int seasonNumber;
  final int episodeCount;
  final String overview;
  final PosterPath? posterPath;
  final DateTime? airDate;
  final double voteAverage;

  String get nameAndAirYear {
    final airYear = airDate?.year;
    return airYear != null ? '$name ($airYear)' : name;
  }

  const TvShowSeason({
    required this.id,
    required this.name,
    required this.seasonNumber,
    required this.episodeCount,
    required this.overview,
    this.posterPath,
    this.airDate,
    required this.voteAverage,
  });

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'seasonNumber: $seasonNumber, '
        'episodeCount: $episodeCount, '
        'overview: $overview, '
        'posterPath: $posterPath, '
        'airDate: $airDate, '
        'voteAverage: $voteAverage';
  }
}
