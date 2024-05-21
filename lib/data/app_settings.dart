import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class ThemeModeAdapter extends PreferenceAdapter<ThemeMode> {
  const ThemeModeAdapter._();
  static const ThemeModeAdapter instance = ThemeModeAdapter._();

  static const Map<int, ThemeMode> indexToThemeMap = <int, ThemeMode>{
    0: ThemeMode.system,
    1: ThemeMode.light,
    2: ThemeMode.dark,
  };

  static const Map<ThemeMode, int> themToIndexMap = <ThemeMode, int>{
    ThemeMode.system: 0,
    ThemeMode.light: 1,
    ThemeMode.dark: 2,
  };

  @override
  ThemeMode? getValue(SharedPreferences preferences, String key) =>
      indexToThemeMap[preferences.getInt(key)];

  @override
  Future<bool> setValue(
          SharedPreferences preferences, String key, ThemeMode value,) =>
      preferences.setInt(key, themToIndexMap[value] ?? 0);
}

class AppSettings {
  factory AppSettings() => _instance;

  AppSettings._internal();
  late final StreamingSharedPreferences _preferences;

  static final AppSettings _instance = AppSettings._internal();

  Future<void> init() async {
    _preferences = await StreamingSharedPreferences.instance;
  }

  Preference<bool> get nsfw => _preferences.getBool(
        'nsfwEnabled',
        defaultValue: false,
      );

  Preference<ThemeMode> get themeMode => _preferences.getCustomValue(
        'themeMode',
        defaultValue: ThemeMode.system,
        adapter: ThemeModeAdapter.instance,
      );
}
