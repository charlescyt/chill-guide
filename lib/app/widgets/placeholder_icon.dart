import 'package:flutter/material.dart';

class PlaceholderIcon extends StatelessWidget {
  const PlaceholderIcon({
    super.key,
    required this.icon,
    this.widthFactor = 0.5,
    this.heightFactor = 0.5,
    this.color,
  });

  final Icon icon;
  final double widthFactor;
  final double heightFactor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      heightFactor: heightFactor,
      child: FittedBox(
        child: Icon(
          Icons.movie,
          color: color,
        ),
      ),
    );
  }
}
