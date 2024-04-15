import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'chill_guide_app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: ChillGuideApp(),
    ),
  );
}
