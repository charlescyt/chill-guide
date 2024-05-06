import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

@immutable
class PersonMovieCastCredit {
  final int id;
  final String title;
  final String character;
  final PosterPath? posterPath;
  final BackdropPath? backdropPath;
  final DateTime? releaseDate;
  final double voteAverage;
  final int voteCount;

  const PersonMovieCastCredit({
    required this.id,
    required this.title,
    required this.character,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
  });

  factory PersonMovieCastCredit.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCastCredit', 'id', 'int', id));
    }

    final title = json['title'];
    if (title is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCastCredit', 'title', 'String', title));
    }

    final character = json['character'];
    if (character is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCastCredit', 'character', 'String', character));
    }

    final posterPath = json['poster_path'];
    if (posterPath != null && posterPath is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCastCredit', 'poster_path', 'String?', posterPath));
    }
    posterPath as String?;

    final backdropPath = json['backdrop_path'];
    if (backdropPath != null && backdropPath is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCastCredit', 'backdrop_path', 'String?', backdropPath));
    }
    backdropPath as String?;

    final releaseDate = json['release_date'];
    if (releaseDate != null && releaseDate is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCastCredit', 'release_date', 'String?', releaseDate));
    }
    releaseDate as String?;

    final voteAverage = json['vote_average'];
    if (voteAverage is! double) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCastCredit', 'vote_average', 'double', voteAverage));
    }

    final voteCount = json['vote_count'];
    if (voteCount is! int) {
      throw FormatException(buildFormatExceptionMessage('PersonMovieCastCredit', 'vote_count', 'int', voteCount));
    }

    return PersonMovieCastCredit(
      id: id,
      title: title,
      character: character,
      posterPath: posterPath == null ? null : PosterPath(posterPath),
      backdropPath: backdropPath == null ? null : BackdropPath(backdropPath),
      releaseDate: releaseDate == null ? null : DateTime.tryParse(releaseDate),
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'title: $title, '
        'character: $character, '
        'posterPath: $posterPath, '
        'backdropPath: $backdropPath, '
        'releaseDate: $releaseDate, '
        'voteAverage: $voteAverage, '
        'voteCount: $voteCount';
  }
}
