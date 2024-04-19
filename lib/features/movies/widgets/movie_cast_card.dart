import 'package:flutter/material.dart';

import '../../../app/widgets/placeholder_icon.dart';
import '../models/movie_cast.dart';
import '../models/movie_crew.dart';

// TODO(charlescyt): The implementation of this widget is similar to MovieCard. Perhaps we can extract a common widget for both.
class MovieCastCard extends StatelessWidget {
  const MovieCastCard({
    super.key,
    required this.cast,
  });

  final MovieCast cast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);
    final subTitleStyle = theme.textTheme.bodySmall;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Card(
            child: InkWell(
              onTap: () {
                // TODO(charlescyt): Navigate to cast details page
              },
              child: switch (cast.profilePath) {
                null => PlaceholderIcon(
                    icon: const Icon(Icons.person),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                final profile => Ink.image(
                    image: NetworkImage(profile.url()),
                    fit: BoxFit.cover,
                  ),
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            cast.name,
            style: titleStyle,
            // maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            cast.character,
            style: subTitleStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class MovieCrewCard extends StatelessWidget {
  const MovieCrewCard({
    super.key,
    required this.crew,
  });

  final MovieCrew crew;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);
    final subTitleStyle = theme.textTheme.bodySmall;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 3,
          child: Card(
            child: InkWell(
              onTap: () {
                // TODO(charlescyt): Navigate to cast details page
              },
              child: switch (crew.profilePath) {
                null => PlaceholderIcon(
                    icon: const Icon(Icons.person),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                final profile => Ink.image(
                    image: NetworkImage(profile.url()),
                    fit: BoxFit.cover,
                  ),
              },
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            crew.name,
            style: titleStyle,
            // maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            crew.job,
            style: subTitleStyle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
