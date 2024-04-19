import 'package:flutter/material.dart';

import '../../../app/widgets/app_card.dart';
import '../../../app/widgets/placeholder_icon.dart';
import '../models/movie_crew.dart';

class MovieCrewCard extends StatelessWidget {
  const MovieCrewCard({
    super.key,
    required this.crew,
    required this.onTap,
  });

  final MovieCrew crew;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final background = switch (crew.profilePath) {
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
      title: crew.name,
      subTitle: crew.job,
    );
  }
}
