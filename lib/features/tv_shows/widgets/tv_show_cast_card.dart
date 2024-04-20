import 'package:flutter/material.dart';

import '../../../app/widgets/app_card.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../models/tv_show_details.dart';

class TvShowCastCard extends StatelessWidget {
  const TvShowCastCard({
    super.key,
    required this.cast,
    required this.onTap,
  });

  final TvShowCast cast;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final background = switch (cast.profilePath) {
      null => PlaceholderIcon(
          icon: const Icon(Icons.person),
          color: theme.colorScheme.primary,
        ),
      final profile => Ink.image(
          image: NetworkImage(profile.url()),
          fit: BoxFit.cover,
        ),
    };

    return AppCard(
      background: background,
      onTap: onTap,
      title: cast.name,
      subTitle: cast.character,
    );
  }
}
