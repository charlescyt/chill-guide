import 'package:flutter/material.dart';

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
