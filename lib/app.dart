import 'package:flutter/material.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';
import 'package:tinasha_v2/data/app_settings.dart';
import 'package:tinasha_v2/router.dart';

class TinashaApp extends StatelessWidget {
  const TinashaApp(this.settings, {super.key});

  final AppSettings settings;

  @override
  Widget build(BuildContext context) {
    return PreferenceBuilder<ThemeMode>(
      preference: settings.themeMode,
      builder: (context, themeMode) {
        return MaterialApp.router(
          routerConfig: router,
          title: 'Tinasha',
          theme: ThemeData(
            colorSchemeSeed: Colors.blue,
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.blue, brightness: Brightness.dark,),
          ),
          themeAnimationCurve: Curves.easeInOut,
          themeMode: themeMode,
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
