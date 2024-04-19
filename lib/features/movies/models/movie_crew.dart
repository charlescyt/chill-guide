import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../common/models/profile_path.dart';

@immutable
class MovieCrew {
  final int id;
  final String name;
  final String job;
  final String department;
  final ProfilePath? profilePath;

  const MovieCrew({
    required this.id,
    required this.name,
    required this.job,
    required this.department,
    this.profilePath,
  });

  factory MovieCrew.fromJson(Map<String, dynamic> json) {
    return MovieCrew(
      id: json['id'] as int,
      name: json['name'] as String,
      job: json['job'] as String,
      department: json['department'] as String,
      profilePath: json['profile_path'] is String ? ProfilePath(json['profile_path'] as String) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'job': job,
      'department': department,
      'profilePath': profilePath?.value,
    };
  }

  @override
  String toString() => '${describeIdentity(this)}(${toJson()})';
}
