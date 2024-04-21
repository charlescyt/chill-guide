import 'package:flutter/material.dart';

import '../../../app/widgets/app_card.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../models/tv_show_season.dart';

class TvShowSeasonCard extends StatelessWidget {
  const TvShowSeasonCard({
    super.key,
    required this.tvShowSeason,
    required this.onTap,
  });

  final TvShowSeason tvShowSeason;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AppCard(
      title: tvShowSeason.name,
      subTitle: tvShowSeason.airDate?.year.toString(),
      background: switch (tvShowSeason.posterPath) {
        null => PlaceholderIcon(
            icon: const Icon(Icons.tv),
            color: theme.colorScheme.primary,
          ),
        final posterPath => Ink.image(
            image: NetworkImage(posterPath.url()),
            fit: BoxFit.cover,
          ),
      },
      onTap: onTap,
    );
  }
}
