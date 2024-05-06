import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

@immutable
class PersonTvShowCastCredit {
  final int id;
  final String name;
  final String character;
  final int? episodeCount;
  final PosterPath? posterPath;
  final BackdropPath? backdropPath;
  final DateTime? firstAirDate;
  final double voteAverage;
  final int voteCount;

  const PersonTvShowCastCredit({
    required this.id,
    required this.name,
    required this.character,
    this.episodeCount,
    this.posterPath,
    this.backdropPath,
    this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory PersonTvShowCastCredit.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('PersonTvShowCastCredit', 'id', 'int', id));
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonTvShowCastCredit', 'name', 'String', name));
    }

    final character = json['character'];
    if (character is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonTvShowCastCredit', 'character', 'String', character));
    }

    final episodeCount = json['episode_count'];
    if (episodeCount != null && episodeCount is! int) {
      throw FormatException(
        buildFormatExceptionMessage('PersonTvShowCastCredit', 'episode_count', 'int?', episodeCount),
      );
    }
    episodeCount as int?;

    final posterPath = json['poster_path'];
    if (posterPath != null && posterPath is! String) {
      throw FormatException(
        buildFormatExceptionMessage('PersonTvShowCastCredit', 'poster_path', 'String?', posterPath),
      );
    }
    posterPath as String?;

    final backdropPath = json['backdrop_path'];
    if (backdropPath != null && backdropPath is! String) {
      throw FormatException(
        buildFormatExceptionMessage('PersonTvShowCastCredit', 'backdrop_path', 'String?', backdropPath),
      );
    }
    backdropPath as String?;

    final firstAirDate = json['first_air_date'];
    if (firstAirDate != null && firstAirDate is! String) {
      throw FormatException(
        buildFormatExceptionMessage('PersonTvShowCastCredit', 'first_air_date', 'String?', firstAirDate),
      );
    }
    firstAirDate as String?;

    final voteAverage = json['vote_average'];
    if (voteAverage is! double) {
      throw FormatException(
        buildFormatExceptionMessage('PersonTvShowCastCredit', 'vote_average', 'double', voteAverage),
      );
    }

    final voteCount = json['vote_count'];
    if (voteCount is! int) {
      throw FormatException(buildFormatExceptionMessage('PersonTvShowCastCredit', 'vote_count', 'int', voteCount));
    }

    return PersonTvShowCastCredit(
      id: id,
      name: name,
      character: character,
      episodeCount: episodeCount,
      posterPath: posterPath == null ? null : PosterPath(posterPath),
      backdropPath: backdropPath == null ? null : BackdropPath(backdropPath),
      firstAirDate: firstAirDate == null ? null : DateTime.tryParse(firstAirDate),
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'character: $character, '
        'episodeCount: $episodeCount, '
        'posterPath: $posterPath, '
        'backdropPath: $backdropPath, '
        'firstAirDate: $firstAirDate, '
        'voteAverage: $voteAverage, '
        'voteCount: $voteCount';
  }
}
