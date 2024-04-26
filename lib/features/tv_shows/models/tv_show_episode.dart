import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
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
  final int voteCount;
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

  factory TvShowEpisode.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'id', 'int', id));
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'name', 'String', name));
    }

    final episodeNumber = json['episode_number'];
    if (episodeNumber is! int) {
      throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'episode_number', 'int', episodeNumber));
    }

    final overview = json['overview'];
    if (overview is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'overview', 'String', overview));
    }

    final stillPath = json['still_path'];
    if (stillPath != null && stillPath is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'still_path', 'String?', stillPath));
    }
    stillPath as String?;

    final airDate = json['air_date'];
    if (airDate != null && airDate is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'air_date', 'String?', airDate));
    }
    final airDateAsDateTime = airDate == null ? null : DateTime.tryParse(airDate as String);
    airDate as String?;

    final voteAverage = json['vote_average'];
    if (voteAverage is! double) {
      throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'vote_average', 'double', voteAverage));
    }

    final voteCount = json['vote_count'];
    if (voteCount is! int) {
      throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'vote_count', 'int', voteCount));
    }

    final runtime = json['runtime'];
    if (runtime != null && runtime is! int) {
      throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'runtime', 'int?', runtime));
    }
    runtime as int?;

    final episodeType = json['episode_type'];
    if (episodeType is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowEpisode', 'episode_type', 'String', episodeType));
    }

    return TvShowEpisode(
      id: id,
      name: name,
      episodeNumber: episodeNumber,
      overview: overview,
      stillPath: stillPath == null ? null : StillPath(stillPath),
      airDate: airDateAsDateTime,
      voteAverage: voteAverage,
      voteCount: voteCount,
      runtime: runtime,
      episodeType: episodeType,
    );
  }

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
