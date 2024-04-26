import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

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

  factory MovieCrew.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('MovieCrew', 'id', 'int', id));
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieCrew', 'name', 'String', name));
    }

    final job = json['job'];
    if (job is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieCrew', 'job', 'String', job));
    }

    final department = json['department'];
    if (department is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieCrew', 'department', 'String', department));
    }

    final profilePath = json['profile_path'];
    if (profilePath != null && profilePath is! String) {
      throw FormatException(buildFormatExceptionMessage('MovieCrew', 'profile_path', 'String?', profilePath));
    }
    profilePath as String?;

    return MovieCrew(
      id: id,
      name: name,
      job: job,
      department: department,
      profilePath: profilePath == null ? null : ProfilePath(profilePath),
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'job: $job, '
        'department: $department, '
        'profilePath: $profilePath';
  }
}
