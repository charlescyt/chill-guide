import 'package:flutter/material.dart';

import 'sliver_sized_box.dart';

class Section extends StatelessWidget {
  const Section({
    super.key,
    required this.title,
    required this.content,
  });

  final Widget title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleTextStyle = theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900);
    final contentTextStyle = theme.textTheme.bodyMedium;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        DefaultTextStyle.merge(
          style: titleTextStyle,
          child: title,
        ),
        const SizedBox(height: 4),
        DefaultTextStyle.merge(
          style: contentTextStyle,
          child: content,
        ),
      ],
    );
  }
}

class SliverSection extends StatelessWidget {
  const SliverSection({
    super.key,
    required this.title,
    required this.content,
    this.padding,
  });

  final Widget title;
  final Widget content;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleTextStyle = theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w900);
    final contentTextStyle = theme.textTheme.bodyMedium;

    final sliver = SliverMainAxisGroup(
      slivers: [
        DefaultTextStyle.merge(
          style: titleTextStyle,
          child: title,
        ),
        const SliverSizedBox(height: 4),
        DefaultTextStyle.merge(
          style: contentTextStyle,
          child: content,
        ),
      ],
    );

    if (padding == null) {
      return sliver;
    }

    return SliverPadding(
      padding: padding!,
      sliver: sliver,
    );
  }
}
