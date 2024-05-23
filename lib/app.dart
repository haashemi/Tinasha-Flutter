import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tinasha_v2/data/app_settings.dart';
import 'package:tinasha_v2/router.dart';

class TinashaApp extends StatelessWidget {
  const TinashaApp(this.settings, {super.key});

  final AppSettings settings;

  static final _defaultLight = ColorScheme.fromSeed(
    seedColor: Colors.blue,
  ).harmonized();

  static final _defaultDark = ColorScheme.fromSeed(
    seedColor: Colors.blue,
    brightness: Brightness.dark,
  ).harmonized();

  void _updateSystemUiOverlay(BuildContext context, ThemeMode themeMode) {
    final brightness = MediaQuery.of(context).platformBrightness;

    final statusBarIconBrightness = switch (themeMode) {
      ThemeMode.dark => Brightness.light,
      ThemeMode.light => Brightness.dark,
      ThemeMode.system =>
        brightness == Brightness.dark ? Brightness.light : Brightness.dark
    };

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: statusBarIconBrightness,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder<ThemeMode>(
      preference: settings.themeMode,
      builder: (context, themeMode) {
        _updateSystemUiOverlay(context, themeMode);

        return DynamicColorBuilder(
          builder: (lightDynamic, darkDynamic) {
            return MaterialApp.router(
              routerConfig: router,
              title: 'Tinasha',
              theme: ThemeData(
                useMaterial3: true,
                colorScheme: lightDynamic?.harmonized() ?? _defaultLight,
              ),
              darkTheme: ThemeData(
                useMaterial3: true,
                brightness: Brightness.dark,
                colorScheme: darkDynamic?.harmonized() ?? _defaultDark,
              ),
              themeAnimationCurve: Curves.easeInOut,
              themeMode: themeMode,
              debugShowCheckedModeBanner: false,
            );
          },
        );
      },
    );
  }
}
