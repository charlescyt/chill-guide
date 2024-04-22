import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    this.title,
    this.actions,
    this.background,
  });

  final Widget? title;
  final List<Widget>? actions;
  final Widget? background;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewPadding = MediaQuery.viewPaddingOf(context);
    final parentRoute = ModalRoute.of(context);

    final height = background != null ? 300.0 : kToolbarHeight;
    final canPop = parentRoute?.canPop == true;
    final useCloseButton = parentRoute is PageRoute && parentRoute.fullscreenDialog;
    final iconBackgroundColor = theme.colorScheme.background.withOpacity(0.8);

    return Material(
      type: MaterialType.transparency,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: height),
        child: Stack(
          children: [
            if (background case final background?) //
              Positioned.fill(child: background),
            Padding(
              padding: EdgeInsets.only(top: viewPadding.top),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  if (title case final title?)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 60),
                      child: DefaultTextStyle.merge(
                        style: theme.textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                        ),
                        child: title,
                      ),
                    ),
                  if (canPop)
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: iconBackgroundColor,
                          ),
                          child: useCloseButton ? const CloseButton() : const BackButton(),
                        ),
                      ),
                    ),
                  if (actions case final actions? when actions.isNotEmpty)
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            for (final action in actions)
                              DecoratedBox(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: iconBackgroundColor,
                                ),
                                child: action,
                              ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
