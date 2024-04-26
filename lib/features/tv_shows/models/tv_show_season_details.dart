import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../../app/utils/exception_utils.dart';
import 'tv_show_episode.dart';

export 'tv_show_episode.dart';

@immutable
class TvShowSeasonDetails {
  final int id;
  final String name;
  final int seasonNumber;
  final String overview;
  final PosterPath? posterPath;
  final DateTime? airDate;
  final double voteAverage;
  final List<TvShowEpisode> episodes;

  String get nameAndAirYear {
    final airYear = airDate?.year;
    return airYear != null ? '$name ($airYear)' : name;
  }

  int get episodeCount {
    return episodes.length;
  }

  const TvShowSeasonDetails({
    required this.id,
    required this.name,
    required this.seasonNumber,
    required this.overview,
    this.posterPath,
    this.airDate,
    required this.voteAverage,
    required this.episodes,
  });

  factory TvShowSeasonDetails.fromTmdb(Map<String, dynamic> json) {
    final id = json['id'];
    if (id is! int) {
      throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'id', 'int', id));
    }

    final name = json['name'];
    if (name is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'name', 'String', name));
    }

    final seasonNumber = json['season_number'];
    if (seasonNumber is! int) {
      throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'season_number', 'int', seasonNumber));
    }

    final overview = json['overview'];
    if (overview is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'overview', 'String', overview));
    }

    final posterPath = json['poster_path'];
    if (posterPath != null && posterPath is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'poster_path', 'String?', posterPath));
    }
    posterPath as String?;

    final airDate = json['air_date'];
    if (airDate != null && airDate is! String) {
      throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'air_date', 'String?', airDate));
    }

    final voteAverage = json['vote_average'];
    if (voteAverage is! double) {
      throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'vote_average', 'double', voteAverage));
    }

    final episodes = json['episodes'];
    if (episodes is! List) {
      throw FormatException(buildFormatExceptionMessage('TvShowSeasonDetails', 'episodes', 'List', episodes));
    }

    return TvShowSeasonDetails(
      id: id,
      name: name,
      seasonNumber: seasonNumber,
      overview: overview,
      posterPath: posterPath == null ? null : PosterPath(posterPath),
      airDate: airDate == null ? null : DateTime.tryParse(airDate as String),
      voteAverage: voteAverage,
      episodes: episodes.cast<Map<String, dynamic>>().map(TvShowEpisode.fromTmdb).toList(),
    );
  }

  @override
  String toString() {
    return '${describeIdentity(this)}, '
        'id: $id, '
        'name: $name, '
        'seasonNumber: $seasonNumber, '
        'overview: $overview, '
        'posterPath: $posterPath, '
        'airDate: $airDate, '
        'voteAverage: $voteAverage'
        'episodes: $episodes';
  }
}
