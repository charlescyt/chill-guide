import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

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

  factory TvShow.fromTmdb(Map<String, dynamic> json) {
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
    if (voteAverage is! double) {
      throw FormatException(buildFormatExceptionMessage('TvShow', 'vote_average', 'double', voteAverage));
    }

    final voteCount = json['vote_count'];
    if (voteCount is! int) {
      throw FormatException(buildFormatExceptionMessage('TvShow', 'vote_count', 'int', voteCount));
    }

    final popularity = json['popularity'];
    if (popularity is! double) {
      throw FormatException(buildFormatExceptionMessage('TvShow', 'popularity', 'double', popularity));
    }

    return TvShow(
      id: id,
      name: name,
      overview: overview,
      posterPath: posterPath == null ? null : PosterPath(posterPath),
      backdropPath: backdropPath == null ? null : BackdropPath(backdropPath),
      firstAirDate: firstAirDate == null ? null : DateTime.tryParse(firstAirDate),
      voteAverage: voteAverage,
      voteCount: voteCount,
      popularity: popularity,
    );
  }

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
