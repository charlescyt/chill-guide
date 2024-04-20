import 'package:flutter/material.dart';

import '../../../app/widgets/app_card.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../models/tv_show.dart';

class TvShowCard extends StatelessWidget {
  const TvShowCard({
    super.key,
    required this.tvShow,
    required this.onTap,
  });

  final TvShow tvShow;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final background = switch (tvShow.posterPath) {
      null => PlaceholderIcon(
          icon: const Icon(Icons.tv),
          color: theme.colorScheme.primary,
        ),
      final posterPath => Ink.image(
          image: NetworkImage(posterPath.url()),
          fit: BoxFit.cover,
        )
    };

    return AppCard(
      background: background,
      onTap: onTap,
      title: tvShow.name,
      subTitle: tvShow.firstAirDate?.year.toString(),
    );
  }
}

class TvShowSkeleton extends StatelessWidget {
  const TvShowSkeleton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const AppCardSkeleton(
      backgroundPlaceholder: PlaceholderIcon(icon: Icon(Icons.tv)),
      showSubTitle: false,
      titleAlignment: TextAlign.center,
    );
  }
}
