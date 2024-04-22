import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import 'logo_path.dart';

export 'logo_path.dart';

@immutable
class Company {
  final int id;
  final String name;
  final LogoPath? logoPath;
  final String originCountry;

  const Company({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });

  factory Company.fromTmdb(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as int,
      name: json['name'] as String,
      logoPath: json['logo_path'] == null ? null : LogoPath(json['logo_path'] as String),
      originCountry: json['origin_country'] as String,
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'logoPath: $logoPath, '
        'originCountry: $originCountry';
  }
}
