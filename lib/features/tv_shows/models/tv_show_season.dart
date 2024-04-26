import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
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

  factory TvShowSeason.fromTmdb(Map<String, dynamic> json) {
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
    final airDateAsDateTime = airDate == null ? null : DateTime.tryParse(airDate as String);

    final voteAverage = json['vote_average'];
    if (voteAverage is! double) {
      throw FormatException(buildFormatExceptionMessage('TvShowSeason', 'vote_average', 'double', voteAverage));
    }

    return TvShowSeason(
      id: id,
      name: name,
      seasonNumber: seasonNumber,
      episodeCount: episodeCount,
      overview: overview,
      posterPath: posterPath == null ? null : PosterPath(posterPath),
      airDate: airDateAsDateTime,
      voteAverage: voteAverage,
    );
  }

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
