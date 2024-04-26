import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

@immutable
class TvShowCast {
  final int id;
  final String name;
  final ProfilePath? profilePath;
  final double popularity;
  final String character;

  const TvShowCast({
    required this.id,
    required this.name,
    this.profilePath,
    required this.popularity,
    required this.character,
  });

  factory TvShowCast.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('TvShowCast', 'id', 'int', id));
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowCast', 'name', 'String', name));
    }

    final profilePath = json['profile_path'];
    if (profilePath != null && profilePath is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowCast', 'profile_path', 'String?', profilePath));
    }
    profilePath as String?;

    final popularity = json['popularity'];
    if (popularity is! double) {
      throw FormatException(buildFormatExceptionMessage('TvShowCast', 'popularity', 'double', popularity));
    }

    final character = json['character'];
    if (character is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowCast', 'character', 'String', character));
    }

    return TvShowCast(
      id: id,
      name: name,
      profilePath: profilePath == null ? null : ProfilePath(profilePath),
      popularity: popularity,
      character: character,
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'profilePath: $profilePath, '
        'popularity: $popularity, '
        'character: $character';
  }
}
