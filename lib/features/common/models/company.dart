import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import 'image_path.dart';

export 'image_path.dart';

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
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('Company', 'id', 'int', id));
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(buildFormatExceptionMessage('Company', 'name', 'String', name));
    }

    final logoPath = json['logo_path'];
    if (logoPath != null && logoPath is! String) {
      throw FormatException(buildFormatExceptionMessage('Company', 'logo_path', 'String?', logoPath));
    }
    logoPath as String?;

    final originCountry = json['origin_country'];
    if (originCountry is! String) {
      throw FormatException(buildFormatExceptionMessage('Company', 'origin_country', 'String', originCountry));
    }

    return Company(
      id: id,
      name: name,
      logoPath: logoPath == null ? null : LogoPath(logoPath),
      originCountry: originCountry,
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
