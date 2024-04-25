import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.trailing,
    this.padding = const EdgeInsets.symmetric(horizontal: 8),
  });

  final Widget title;
  final Widget? trailing;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final titleTextStyle = theme.textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold);

    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 48),
      child: Padding(
        padding: padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 4,
              height: 24,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: DefaultTextStyle.merge(
                style: titleTextStyle,
                child: title,
              ),
            ),
            const SizedBox(width: 8),
            if (trailing case final trailing?) //
              trailing,
          ],
        ),
      ),
    );
  }
}

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
    final contentTextStyle = theme.textTheme.bodyMedium;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionTitle(title: title),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: DefaultTextStyle.merge(
            style: contentTextStyle,
            child: content,
          ),
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
  });

  final Widget title;
  final Widget content;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Section(
        title: title,
        content: content,
      ),
    );
  }
}
