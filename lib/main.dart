import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tinasha_v2/app.dart';
import 'package:tinasha_v2/data/app_settings.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  final settings = AppSettings();
  await settings.init();

  runApp(TinashaApp(settings));
}
