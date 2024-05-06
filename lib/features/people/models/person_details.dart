// ignore_for_file: avoid_dynamic_calls

import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import 'person_movie_cast_credit.dart';
import 'person_movie_crew_credit.dart';
import 'person_tv_show_cast_credit.dart';
import 'person_tv_show_crew_credit.dart';

export '../../common/models/image_path.dart';
export 'person_movie_cast_credit.dart';
export 'person_movie_crew_credit.dart';
export 'person_tv_show_cast_credit.dart';
export 'person_tv_show_crew_credit.dart';

@immutable
class PersonDetails {
  final int id;
  final String name;
  final String? biography;
  final ProfilePath? profilePath;
  final String? placeOfBirth;
  final DateTime? birthday;
  final DateTime? deathday;
  final double popularity;
  final String knownForDepartment;
  final List<ProfilePath> images;
  final List<PersonMovieCastCredit> movieCastCredits;
  final List<PersonMovieCrewCredit> movieCrewCredits;
  final List<PersonTvShowCastCredit> tvShowCastCredits;
  final List<PersonTvShowCrewCredit> tvShowCrewCredits;

  const PersonDetails({
    required this.id,
    required this.name,
    this.biography,
    this.profilePath,
    this.placeOfBirth,
    this.birthday,
    this.deathday,
    required this.popularity,
    required this.knownForDepartment,
    required this.images,
    required this.movieCastCredits,
    required this.movieCrewCredits,
    required this.tvShowCastCredits,
    required this.tvShowCrewCredits,
  });

  factory PersonDetails.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('PersonDetails', 'id', 'int', id));
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonDetails', 'name', 'String', name));
    }

    final biography = json['biography'];
    if (biography != null && biography is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonDetails', 'biography', 'String?', biography));
    }
    biography as String?;

    final profilePath = json['profile_path'];
    if (profilePath != null && profilePath is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonDetails', 'profile_path', 'String?', profilePath));
    }
    profilePath as String?;

    final placeOfBirth = json['place_of_birth'];
    if (placeOfBirth != null && placeOfBirth is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonDetails', 'place_of_birth', 'String?', placeOfBirth));
    }
    placeOfBirth as String?;

    final birthday = json['birthday'];
    if (birthday != null && birthday is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonDetails', 'birthday', 'String?', birthday));
    }
    birthday as String?;

    final deathday = json['deathday'];
    if (deathday != null && deathday is! String) {
      throw FormatException(buildFormatExceptionMessage('PersonDetails', 'deathday', 'String?', deathday));
    }
    deathday as String?;

    final popularity = json['popularity'];
    if (popularity is! double) {
      throw FormatException(buildFormatExceptionMessage('PersonDetails', 'popularity', 'double', popularity));
    }

    final knownForDepartment = json['known_for_department'];
    if (knownForDepartment is! String) {
      throw FormatException(
        buildFormatExceptionMessage('PersonDetails', 'known_for_department', 'String', knownForDepartment),
      );
    }

    final images = <ProfilePath>[];
    final profiles = json['images']['profiles'];
    if (profiles != null && profiles is List) {
      for (final profile in profiles) {
        if (profile is Map<String, dynamic>) {
          final filePath = profile['file_path'];
          if (filePath is String) {
            images.add(ProfilePath(filePath));
          }
        }
      }
    }

    final movieCastCredits = <PersonMovieCastCredit>[];
    final movieCast = json['movie_credits']['cast'];
    if (movieCast != null && movieCast is List) {
      for (final movie in movieCast) {
        if (movie is Map<String, dynamic>) {
          movieCastCredits.add(PersonMovieCastCredit.fromTmdb(movie));
        }
      }
    }

    final movieCrewCredits = <PersonMovieCrewCredit>[];
    final movieCrew = json['movie_credits']['crew'];
    if (movieCrew != null && movieCrew is List) {
      for (final movie in movieCrew) {
        if (movie is Map<String, dynamic>) {
          movieCrewCredits.add(PersonMovieCrewCredit.fromTmdb(movie));
        }
      }
    }

    final tvShowCastCredits = <PersonTvShowCastCredit>[];
    final tvShowCast = json['tv_credits']['cast'];
    if (tvShowCast != null && tvShowCast is List) {
      for (final tvShow in tvShowCast) {
        if (tvShow is Map<String, dynamic>) {
          tvShowCastCredits.add(PersonTvShowCastCredit.fromTmdb(tvShow));
        }
      }
    }

    final tvShowCrewCredits = <PersonTvShowCrewCredit>[];
    final tvShowCrew = json['tv_credits']['crew'];
    if (tvShowCrew != null && tvShowCrew is List) {
      for (final tvShow in tvShowCrew) {
        if (tvShow is Map<String, dynamic>) {
          tvShowCrewCredits.add(PersonTvShowCrewCredit.fromTmdb(tvShow));
        }
      }
    }

    return PersonDetails(
      id: id,
      name: name,
      biography: biography,
      profilePath: profilePath == null ? null : ProfilePath(profilePath),
      placeOfBirth: placeOfBirth,
      birthday: birthday == null ? null : DateTime.tryParse(birthday),
      deathday: deathday == null ? null : DateTime.tryParse(deathday),
      popularity: popularity,
      knownForDepartment: knownForDepartment,
      images: images,
      movieCastCredits: movieCastCredits,
      movieCrewCredits: movieCrewCredits,
      tvShowCastCredits: tvShowCastCredits,
      tvShowCrewCredits: tvShowCrewCredits,
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'biography: $biography, '
        'profilePath: $profilePath, '
        'placeOfBirth: $placeOfBirth, '
        'birthday: $birthday, '
        'deathday: $deathday, '
        'popularity: $popularity, '
        'knownForDepartment: $knownForDepartment, '
        'images: $images, '
        'movieCastCredits: $movieCastCredits, '
        'movieCrewCredits: $movieCrewCredits, '
        'tvShowCastCredits: $tvShowCastCredits, '
        'tvShowCrewCredits: $tvShowCrewCredits';
  }
}
