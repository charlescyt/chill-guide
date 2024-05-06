import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

@immutable
class PersonMovieCrewCredit {
  final int id;
  final String title;
  final String department;
  final String job;
  final PosterPath? posterPath;
  final BackdropPath? backdropPath;
  final DateTime? releaseDate;
  final double voteAverage;
  final int voteCount;

  const PersonMovieCrewCredit({
    required this.id,
    required this.title,
    required this.department,
    required this.job,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory PersonMovieCrewCredit.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCrewCredit', 'id', 'int', id));
    }

    final title = json['title'];
    if (title is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCrewCredit', 'title', 'String', title));
    }

    final department = json['department'];
    if (department is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCrewCredit', 'department', 'String', department));
    }

    final job = json['job'];
    if (job is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCrewCredit', 'job', 'String', job));
    }

    final posterPath = json['poster_path'];
    if (posterPath != null && posterPath is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCrewCredit', 'poster_path', 'String?', posterPath));
    }
    posterPath as String?;

    final backdropPath = json['backdrop_path'];
    if (backdropPath != null && backdropPath is! String) {
      throw FormatException(
        buildFormatExceptionMessage('PersonMovieCrewCredit', 'backdrop_path', 'String?', backdropPath),
      );
    }
    backdropPath as String?;

    final releaseDate = json['release_date'];
    if (releaseDate != null && releaseDate is! String) {
      throw FormatException(
        buildFormatExceptionMessage('PersonMovieCrewCredit', 'release_date', 'String?', releaseDate),
      );
    }
    releaseDate as String?;
    final parsedReleaseDate = releaseDate == null ? null : DateTime.tryParse(releaseDate);

    final voteAverage = json['vote_average'];
    if (voteAverage is! double) {
      throw FormatException(
        buildFormatExceptionMessage('PersonMovieCrewCredit', 'vote_average', 'double', voteAverage),
      );
    }

    final voteCount = json['vote_count'];
    if (voteCount is! int) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCrewCredit', 'vote_count', 'int', voteCount));
    }

    return PersonMovieCrewCredit(
      id: id,
      title: title,
      department: department,
      job: job,
      posterPath: posterPath == null ? null : PosterPath(posterPath),
      backdropPath: backdropPath == null ? null : BackdropPath(backdropPath),
      releaseDate: parsedReleaseDate,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'title: $title, '
        'department: $department, '
        'job: $job, '
        'posterPath: $posterPath, '
        'backdropPath: $backdropPath, '
        'releaseDate: $releaseDate, '
        'voteAverage: $voteAverage, '
        'voteCount: $voteCount';
  }
}
