import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tinasha_v2/data/app_settings.dart';
import 'package:tinasha_v2/router.dart';

class TinashaApp extends StatelessWidget {
  const TinashaApp(this.settings, {super.key});

  final AppSettings settings;

  void _updateSystemUiOverlay(BuildContext context, ThemeMode themeMode) {
    final brightness = MediaQuery.of(context).platformBrightness;

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarIconBrightness: switch (themeMode) {
          ThemeMode.dark => Brightness.light,
          ThemeMode.light => Brightness.dark,
          ThemeMode.system =>
            brightness == Brightness.dark ? Brightness.light : Brightness.dark
        },
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

        return MaterialApp.router(
          routerConfig: router,
          title: 'Tinasha',
          theme: ThemeData(
            colorSchemeSeed: Colors.blue,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.blue,
              brightness: Brightness.dark,
            ),
          ),
          themeAnimationCurve: Curves.easeInOut,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
