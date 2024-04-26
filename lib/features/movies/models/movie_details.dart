// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/company.dart';
import '../../common/models/genre.dart';
import 'movie.dart';
import 'movie_cast.dart';
import 'movie_crew.dart';

export '../../common/models/company.dart';
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
  final String? homepage;
  final List<Genre> genres;
  final List<MovieCast> casts;
  final List<MovieCrew> crews;
  final List<Company> productionCompanies;
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
    this.homepage,
    required this.genres,
    required this.casts,
    required this.crews,
    required this.productionCompanies,
    required this.recommendations,
  });

  factory MovieDetails.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'id', 'int', id));
    }

    final title = json['title'];
    if (title is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'title', 'String', title));
    }

    final overview = json['overview'];
    if (overview is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'overview', 'String', overview));
    }

    final posterPath = json['poster_path'];
    if (posterPath != null && posterPath is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'poster_path', 'String?', posterPath));
    }
    posterPath as String?;

    final backdropPath = json['backdrop_path'];
    if (backdropPath != null && backdropPath is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'backdrop_path', 'String?', backdropPath));
    }
    backdropPath as String?;

    final voteAverage = json['vote_average'];
    if (voteAverage is! double) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'vote_average', 'num', voteAverage));
    }

    final voteCount = json['vote_count'];
    if (voteCount is! int) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'vote_count', 'int', voteCount));
    }

    final releaseDate = json['release_date'];
    if (releaseDate != null && releaseDate is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'release_date', 'String?', releaseDate));
    }
    releaseDate as String?;

    final popularity = json['popularity'];
    if (popularity is! double) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'popularity', 'num', popularity));
    }

    final runtime = json['runtime'];
    if (runtime is! int) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'runtime', 'int', runtime));
    }

    final tagline = json['tagline'];
    if (tagline is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'tagline', 'String', tagline));
    }

    final status = json['status'];
    if (status is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'status', 'String', status));
    }

    final originalLanguage = json['original_language'];
    if (originalLanguage is! String) {
      throw FormatException(
        buildFormatExceptionMessage('MovieDetails', 'original_language', 'String', originalLanguage),
      );
    }

    final budget = json['budget'];
    if (budget is! int) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'budget', 'int', budget));
    }

    final revenue = json['revenue'];
    if (revenue is! int) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'revenue', 'int', revenue));
    }

    final homepage = json['homepage'];
    if (homepage != null && homepage is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'homepage', 'String?', homepage));
    }
    homepage as String?;

    final genres = json['genres'];
    if (genres is! List) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'genres', 'List', genres));
    }

    final casts = json['credits']['cast'];
    if (casts is! List) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'casts', 'List', casts));
    }

    final crews = json['credits']['crew'];
    if (crews is! List) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'crews', 'List', crews));
    }

    final productionCompanies = json['production_companies'];
    if (productionCompanies is! List) {
      throw FormatException(
        buildFormatExceptionMessage('MovieDetails', 'production_companies', 'List', productionCompanies),
      );
    }

    final recommendations = json['recommendations']['results'];
    if (recommendations is! List) {
      throw FormatException(buildFormatExceptionMessage('MovieDetails', 'recommendations', 'List', recommendations));
    }

    return MovieDetails(
      id: id,
      title: title,
      overview: overview,
      posterPath: posterPath == null ? null : PosterPath(posterPath),
      backdropPath: backdropPath == null ? null : BackdropPath(backdropPath),
      voteAverage: voteAverage,
      voteCount: voteCount,
      releaseDate: releaseDate == null ? null : DateTime.parse(releaseDate),
      popularity: popularity,
      runtime: runtime,
      tagline: tagline,
      status: status,
      originalLanguage: originalLanguage,
      budget: budget,
      revenue: revenue,
      homepage: homepage,
      genres: genres.cast<Map<String, dynamic>>().map(Genre.fromTmdb).toList(),
      casts: casts.cast<Map<String, dynamic>>().map(MovieCast.fromTmdb).toList(),
      crews: crews.cast<Map<String, dynamic>>().map(MovieCrew.fromTmdb).toList(),
      productionCompanies: productionCompanies.cast<Map<String, dynamic>>().map(Company.fromTmdb).toList(),
      recommendations: recommendations.cast<Map<String, dynamic>>().map(Movie.fromTmdb).toList(),
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
