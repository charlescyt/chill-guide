import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../common/models/image_path.dart';

export '../../common/models/image_path.dart';

@immutable
class TvShowEpisode {
  final int id;
  final String name;
  final int episodeNumber;
  final String overview;
  final StillPath? stillPath;
  final DateTime? airDate;
  final double voteAverage;
  final double voteCount;
  final int? runtime;
  final String episodeType;

  String get numberAndName {
    return '$episodeNumber - $name';
  }

  const TvShowEpisode({
    required this.id,
    required this.name,
    required this.episodeNumber,
    required this.overview,
    this.stillPath,
    this.airDate,
    required this.voteAverage,
    required this.voteCount,
    this.runtime,
    required this.episodeType,
  });

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'episodeNumber: $episodeNumber, '
        'overview: $overview, '
        'stillPath: $stillPath, '
        'airDate: $airDate, '
        'voteAverage: $voteAverage'
        'voteCount: $voteCount'
        'runtime: $runtime'
        'episodeType: $episodeType';
  }
}
