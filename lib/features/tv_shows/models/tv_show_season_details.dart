import 'package:flutter/foundation.dart' show describeIdentity, immutable;

import '../../common/models/poster_path.dart';
import 'tv_show_episode.dart';

export '../../common/models/poster_path.dart';
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
