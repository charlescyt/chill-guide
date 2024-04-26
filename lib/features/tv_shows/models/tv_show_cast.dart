import 'package:flutter/foundation.dart' show describeIdentity, immutable;

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
