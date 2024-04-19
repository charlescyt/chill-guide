import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({
    super.key,
    this.title,
    this.actions,
  });

  final Widget? title;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final viewPadding = MediaQuery.viewPaddingOf(context);
    final parentRoute = ModalRoute.of(context);
    final canPop = parentRoute?.canPop == true;
    final useCloseButton = parentRoute is PageRoute && parentRoute.fullscreenDialog;

    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: EdgeInsets.only(top: viewPadding.top),
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: kToolbarHeight),
          child: Stack(
            alignment: Alignment.center,
            children: [
              if (title case final title?)
                DefaultTextStyle.merge(
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 48),
                    child: title,
                  ),
                ),
              if (canPop)
                Align(
                  alignment: Alignment.centerLeft,
                  child: useCloseButton ? const CloseButton() : const BackButton(),
                ),
              if (actions case final actions? when actions.isNotEmpty)
                Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
