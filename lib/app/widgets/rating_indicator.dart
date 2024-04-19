import 'package:flutter/material.dart';

class RatingIndicator extends StatelessWidget {
  const RatingIndicator({
    super.key,
    required this.rating,
    this.iconSize = 14,
  });

  final double rating;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = theme.colorScheme.secondary;
    final textStyles = theme.textTheme.bodyMedium?.copyWith(
      fontWeight: FontWeight.bold,
      color: color,
    );
    final roundedRating = rating.round();
    final numberOfFullStars = roundedRating ~/ 2;
    final hasHalfStar = roundedRating.isOdd;
    final numberOfEmptyStars = 5 - numberOfFullStars - (hasHalfStar ? 1 : 0);

    final Widget fullStar = Icon(
      Icons.star,
      size: iconSize,
      color: color,
    );

    final Widget halfStar = Icon(
      Icons.star_half,
      size: iconSize,
      color: color,
    );

    final Widget emptyStar = Icon(
      Icons.star_border,
      size: iconSize,
      color: color,
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        for (var i = 0; i < numberOfFullStars; i++) fullStar,
        if (hasHalfStar) halfStar,
        for (var i = 0; i < numberOfEmptyStars; i++) emptyStar,
        const SizedBox(width: 4),
        Text(
          rating.toStringAsFixed(1),
          style: textStyles,
        ),
      ],
    );
  }
}
