import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

@immutable
class Movie {
  final int id;
  final String title;
  final String overview;
  final PosterPath? posterPath;
  final BackdropPath? backdropPath;
  final DateTime? releaseDate;
  final double voteAverage;
  final int voteCount;
  final double popularity;

  String get titleAndReleaseYear {
    final year = releaseDate?.year;
    return year == null ? title : '$title ($year)';
  }

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    this.releaseDate,
    required this.voteAverage,
    required this.voteCount,
    required this.popularity,
  });

  factory Movie.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('Movie', 'id', 'int', id));
    }

    final title = json['title'];
    if (title is! String) {
      throw FormatException(buildFormatExceptionMessage('Movie', 'title', 'String', title));
    }

    final overview = json['overview'];
    if (overview is! String) {
      throw FormatException(buildFormatExceptionMessage('Movie', 'overview', 'String', overview));
    }

    final posterPath = json['poster_path'];
    if (posterPath != null && posterPath is! String) {
      throw FormatException(buildFormatExceptionMessage('Movie', 'poster_path', 'String?', posterPath));
    }
    posterPath as String?;

    final backdropPath = json['backdrop_path'];
    if (backdropPath != null && backdropPath is! String) {
      throw FormatException(buildFormatExceptionMessage('Movie', 'backdrop_path', 'String?', backdropPath));
    }
    backdropPath as String?;

    final releaseDate = json['release_date'];
    if (releaseDate != null && releaseDate is! String) {
      throw FormatException(buildFormatExceptionMessage('Movie', 'release_date', 'String?', releaseDate));
    }
    releaseDate as String?;

    final voteAverage = json['vote_average'];
    if (voteAverage is! double) {
      throw FormatException(buildFormatExceptionMessage('Movie', 'vote_average', 'double', voteAverage));
    }

    final voteCount = json['vote_count'];
    if (voteCount is! int) {
      throw FormatException(buildFormatExceptionMessage('Movie', 'vote_count', 'int', voteCount));
    }

    final popularity = json['popularity'];
    if (popularity is! double) {
      throw FormatException(buildFormatExceptionMessage('Movie', 'popularity', 'double', popularity));
    }

    return Movie(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath == null ? null : PosterPath(posterPath),
      backdropPath: backdropPath == null ? null : BackdropPath(backdropPath),
      releaseDate: releaseDate == null ? null : DateTime.tryParse(releaseDate),
      voteAverage: voteAverage,
      voteCount: voteCount,
      popularity: popularity,
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'title: $title, '
        'overview: $overview, '
        'posterPath: $posterPath, '
        'backdropPath: $backdropPath, '
        'releaseDate: $releaseDate, '
        'voteAverage: $voteAverage, '
        'voteCount: $voteCount, '
        'popularity: $popularity';
  }
}
