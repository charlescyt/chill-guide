import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../common/models/backdrop.dart';
import '../../common/models/poster.dart';

export '../../common/models/backdrop.dart';
export '../../common/models/poster.dart';

@immutable
class Movie {
  final int id;
  final String title;
  final String overview;
  final Poster? poster;
  final Backdrop? backdrop;
  final DateTime? releaseDate;
  final double voteAverage;
  final int voteCount;
  final double popularity;

  const Movie({
    required this.id,
    required this.title,
    required this.overview,
    this.poster,
    this.backdrop,
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
      poster: json['poster_path'] is String ? Poster(json['poster_path'] as String) : null,
      backdrop: json['backdrop_path'] is String ? Backdrop(json['backdrop_path'] as String) : null,
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
      'poster': poster?.path,
      'backdrop': backdrop?.path,
      'releaseDate': releaseDate?.toIso8601String(),
      'voteAverage': voteAverage,
      'voteCount': voteCount,
      'popularity': popularity,
    };
  }

  @override
  String toString() => '${describeIdentity(this)}(${toJson()})';
}
