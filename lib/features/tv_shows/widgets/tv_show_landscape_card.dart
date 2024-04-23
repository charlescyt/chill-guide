import 'package:flutter/material.dart';

import '../../../app/widgets/app_card.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../models/tv_show.dart';

class TvShowLandscapeCard extends StatelessWidget {
  const TvShowLandscapeCard({
    super.key,
    required this.tvShow,
    required this.onTap,
  });

  final TvShow tvShow;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final background = switch (tvShow.backdropPath) {
      null => PlaceholderIcon(
          icon: const Icon(Icons.tv),
          color: theme.colorScheme.primary,
        ),
      final backdrop => Ink.image(
          image: NetworkImage(backdrop.url()),
          fit: BoxFit.cover,
        )
    };

    return AppCard(
      background: background,
      onTap: onTap,
      title: tvShow.nameAndFirstAirYear,
    );
  }
}
