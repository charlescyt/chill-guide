import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart' show immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

@immutable
class MovieCast {
  final int id;
  final String name;
  final String character;
  final ProfilePath? profilePath;

  const MovieCast({
    required this.id,
    required this.name,
    required this.character,
    this.profilePath,
  });

  factory MovieCast.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('MovieCast', 'id', 'int', id));
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieCast', 'name', 'String', name));
    }

    final character = json['character'];
    if (character is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieCast', 'character', 'String', character));
    }

    final profilePath = json['profile_path'];
    if (profilePath != null && profilePath is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieCast', 'profile_path', 'String?', profilePath));
    }
    profilePath as String?;

    return MovieCast(
      id: id,
      name: name,
      character: character,
      profilePath: profilePath == null ? null : ProfilePath(profilePath),
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'character: $character, '
        'profilePath: $profilePath';
  }
}
