// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../common/models/genre.dart';
import 'movie.dart';
import 'movie_cast.dart';
import 'movie_crew.dart';

export '../../common/models/genre.dart';
export 'movie.dart';
export 'movie_cast.dart';
export 'movie_crew.dart';

@immutable
class MovieDetails {
  final int id;
  final String title;
  final String overview;
  final PosterPath? posterPath;
  final BackdropPath? backdropPath;
  final double voteAverage;
  final int voteCount;
  final DateTime? releaseDate;
  final double popularity;
  final int runtime;
  final String tagline;
  final String status;
  final String originalLanguage;
  final int budget;
  final int revenue;
  final String homepage;
  final List<Genre> genres;
  final List<MovieCast> casts;
  final List<MovieCrew> crews;
  final List<Movie> recommendations;

  String get titleAndYear {
    final year = releaseDate?.year;
    return year == null ? title : '$title ($year)';
  }

  List<MovieCrew> get directors => crews.where((crew) => crew.job == 'Director').toList();

  const MovieDetails({
    required this.id,
    required this.title,
    required this.overview,
    this.posterPath,
    this.backdropPath,
    required this.voteAverage,
    required this.voteCount,
    this.releaseDate,
    required this.popularity,
    required this.runtime,
    required this.tagline,
    required this.status,
    required this.originalLanguage,
    required this.budget,
    required this.revenue,
    required this.homepage,
    required this.genres,
    required this.casts,
    required this.crews,
    required this.recommendations,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) {
    return MovieDetails(
      id: json['id'] as int,
      title: json['title'] as String,
      overview: json['overview'] as String,
      posterPath: json['poster_path'] is String ? PosterPath(json['poster_path'] as String) : null,
      backdropPath: json['backdrop_path'] is String ? BackdropPath(json['backdrop_path'] as String) : null,
      voteAverage: (json['vote_average'] as num).toDouble(),
      voteCount: json['vote_count'] as int,
      releaseDate: json['release_date'] == null || json['release_date'] == ''
          ? null
          : DateTime.parse(json['release_date'] as String),
      popularity: (json['popularity'] as num).toDouble(),
      runtime: json['runtime'] as int,
      tagline: json['tagline'] as String,
      status: json['status'] as String,
      originalLanguage: json['original_language'] as String,
      budget: json['budget'] as int,
      revenue: json['revenue'] as int,
      homepage: json['homepage'] as String,
      genres: (json['genres'] as List).cast<Map<String, dynamic>>().map(Genre.fromJson).toList(),
      casts: (json['credits']['cast'] as List).cast<Map<String, dynamic>>().map(MovieCast.fromJson).toList(),
      crews: (json['credits']['crew'] as List).cast<Map<String, dynamic>>().map(MovieCrew.fromJson).toList(),
      recommendations:
          (json['recommendations']['results'] as List).cast<Map<String, dynamic>>().map(Movie.fromJson).toList(),
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'title: $title, '
        'overview: $overview, '
        'posterPath: ${posterPath?.value}, '
        'backdropPath: ${backdropPath?.path}, '
        'voteAverage: $voteAverage, '
        'voteCount: $voteCount, '
        'releaseDate: $releaseDate, '
        'popularity: $popularity, '
        'runtime: $runtime, '
        'tagline: $tagline, '
        'status: $status, '
        'originalLanguage: $originalLanguage, '
        'budget: $budget, '
        'revenue: $revenue, '
        'homepage: $homepage, '
        'genres: $genres, '
        'casts: $casts, '
        'crews: $crews, '
        'recommendations: $recommendations';
  }
}
