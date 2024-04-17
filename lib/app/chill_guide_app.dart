import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show DeviceOrientation, SystemChrome, SystemUiMode, SystemUiOverlayStyle;
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'router/router.dart';
import 'theme/app_theme.dart';

class ChillGuideApp extends ConsumerStatefulWidget {
  const ChillGuideApp({super.key});

  @override
  ConsumerState<ChillGuideApp> createState() => _ChillGuideAppState();
}

class _ChillGuideAppState extends ConsumerState<ChillGuideApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  }

  @override
  Widget build(BuildContext context) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Chill Guide',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      routerConfig: router,
      builder: (context, child) {
        final theme = Theme.of(context);
        final isLightTheme = theme.brightness == Brightness.light;
        final uiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarBrightness: isLightTheme ? Brightness.light : Brightness.dark,
          statusBarIconBrightness: isLightTheme ? Brightness.dark : Brightness.light,
          systemNavigationBarColor: Colors.transparent,
          systemNavigationBarIconBrightness: isLightTheme ? Brightness.dark : Brightness.light,
        );

        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: uiOverlayStyle,
          child: child!,
        );
      },
    );
  }
}
