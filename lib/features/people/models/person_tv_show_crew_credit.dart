import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

@immutable
class PersonTvShowCrewCredit {
  final int id;
  final String name;
  final String department;
  final String job;
  final int? episodeCount;
  final PosterPath? posterPath;
  final BackdropPath? backdropPath;
  final DateTime? firstAirDate;
  final double voteAverage;
  final int voteCount;

  const PersonTvShowCrewCredit({
    required this.id,
    required this.name,
    required this.department,
    required this.job,
     this.episodeCount,
    this.posterPath,
    this.backdropPath,
    this.firstAirDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory PersonTvShowCrewCredit.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('PersonTvShowCrewCredit', 'id', 'int', id));
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonTvShowCrewCredit', 'name', 'String', name));
    }

    final department = json['department'];
    if (department is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonTvShowCrewCredit', 'department', 'String', department));
    }

    final job = json['job'];
    if (job is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonTvShowCrewCredit', 'job', 'String', job));
    }

    final episodeCount = json['episode_count'];
    if (episodeCount != null && episodeCount is! int) {
      throw FormatException(
        buildFormatExceptionMessage('PersonTvShowCrewCredit', 'episode_count', 'int?', episodeCount),
      );
    }
    episodeCount as int?;

    final posterPath = json['poster_path'];
    if (posterPath != null && posterPath is! String) {
      throw FormatException(
        buildFormatExceptionMessage('PersonTvShowCrewCredit', 'poster_path', 'String?', posterPath),
      );
    }
    posterPath as String?;

    final backdropPath = json['backdrop_path'];
    if (backdropPath != null && backdropPath is! String) {
      throw FormatException(
        buildFormatExceptionMessage('PersonTvShowCrewCredit', 'backdrop_path', 'String?', backdropPath),
      );
    }
    backdropPath as String?;

    final firstAirDate = json['first_air_date'];
    if (firstAirDate != null && firstAirDate is! String) {
      throw FormatException(
        buildFormatExceptionMessage('PersonTvShowCrewCredit', 'first_air_date', 'String?', firstAirDate),
      );
    }
    firstAirDate as String?;

    final voteAverage = json['vote_average'];
    if (voteAverage is! double) {
      throw FormatException(
        buildFormatExceptionMessage('PersonTvShowCrewCredit', 'vote_average', 'double', voteAverage),
      );
    }

    final voteCount = json['vote_count'];
    if (voteCount is! int) {
      throw FormatException(buildFormatExceptionMessage('PersonTvShowCrewCredit', 'vote_count', 'int', voteCount));
    }

    return PersonTvShowCrewCredit(
      id: id,
      name: name,
      department: department,
      job: job,
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
        'department: $department, '
        'job: $job, '
        'episodeCount: $episodeCount, '
        'posterPath: $posterPath, '
        'backdropPath: $backdropPath, '
        'firstAirDate: $firstAirDate, '
        'voteAverage: $voteAverage, '
        'voteCount: $voteCount';
  }
}
