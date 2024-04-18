import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../common/models/backdrop_path.dart';
import '../../common/models/poster_path.dart';

export '../../common/models/backdrop_path.dart';
export '../../common/models/poster_path.dart';

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

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] is String ? PosterPath(json['poster_path'] as String) : null,
      backdropPath: json['backdrop_path'] is String ? BackdropPath(json['backdrop_path'] as String) : null,
      releaseDate: json['release_date'] == null || json['release_date'] == ''
          ? null
          : DateTime.parse(json['release_date'] as String),
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      popularity: (json['popularity'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'posterPath': posterPath?.value,
      'backdropPath': backdropPath?.path,
      'releaseDate': releaseDate?.toIso8601String(),
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'popularity': popularity,
    };
  }

  String get titleAndReleaseYear {
    if (releaseDate == null) {
      return title;
    }

    return '$title (${releaseDate!.year})';
  }

  @override
  String toString() => '${describeIdentity(this)}(${toJson()})';
}
