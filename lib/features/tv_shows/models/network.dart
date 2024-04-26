import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

@immutable
class Network {
  final int id;
  final String name;
  final LogoPath? logoPath;
  final String originCountry;

  const Network({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });

  factory Network.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('Network', 'id', 'int', id));
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(buildFormatExceptionMessage('Network', 'name', 'String', name));
    }

    final logoPath = json['logo_path'];
    if (logoPath != null && logoPath is! String) {
      throw FormatException(buildFormatExceptionMessage('Network', 'logo_path', 'String?', logoPath));
    }
    logoPath as String?;

    final originCountry = json['origin_country'];
    if (originCountry is! String) {
      throw FormatException(buildFormatExceptionMessage('Network', 'origin_country', 'String', originCountry));
    }
    return Network(
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
