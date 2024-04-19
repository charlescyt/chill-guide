import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meta/meta.dart' show immutable;

import '../../common/models/profile_path.dart';

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

  factory MovieCast.fromJson(Map<String, dynamic> json) {
    return MovieCast(
      id: json['id'] as int,
      name: json['name'] as String,
      character: json['character'] as String,
      profilePath: json['profile_path'] is String ? ProfilePath(json['profile_path'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'character': character,
      'profilePath': profilePath?.value,
    };
  }

  @override
  String toString() => '${describeIdentity(this)}(${toJson()})';
}
