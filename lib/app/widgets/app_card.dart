import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.background,
    required this.onTap,
    required this.title,
    this.subTitle,
    this.titleAlignment,
    this.subTitleAlignment,
  });

  final Widget background;
  final VoidCallback onTap;
  final String title;
  final String? subTitle;
  final TextAlign? titleAlignment;
  final TextAlign? subTitleAlignment;

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
          child: Card(
            child: InkWell(
              onTap: onTap,
              child: background,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            title,
            style: titleStyle,
            overflow: TextOverflow.ellipsis,
            textAlign: titleAlignment,
          ),
        ),
        if (subTitle case final subTitle?)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              subTitle,
              style: subTitleStyle,
              overflow: TextOverflow.ellipsis,
              textAlign: subTitleAlignment,
            ),
          ),
      ],
    );
  }
}

class AppCardSkeleton extends StatelessWidget {
  const AppCardSkeleton({
    super.key,
    required this.backgroundPlaceholder,
    this.showSubTitle = true,
    this.titleAlignment,
    this.subTitleAlignment,
  });

  final Widget backgroundPlaceholder;
  final bool showSubTitle;
  final TextAlign? titleAlignment;
  final TextAlign? subTitleAlignment;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleStyle = theme.textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold);
    final subTitleStyle = theme.textTheme.bodySmall;

    return Skeletonizer.zone(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Card(
              child: Skeleton.shade(
                child: backgroundPlaceholder,
              ),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Bone.text(
              width: 100,
              style: titleStyle,
              textAlign: titleAlignment ?? TextAlign.start,
            ),
          ),
          if (showSubTitle) ...[
            const SizedBox(height: 4),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Bone.text(
                width: 40,
                style: subTitleStyle,
                textAlign: subTitleAlignment ?? TextAlign.start,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
