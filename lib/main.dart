import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tinasha_v2/app.dart';
import 'package:tinasha_v2/data/app_settings.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  final settings = AppSettings();
  await settings.init();

  // Remove the leading hash (#) from the URL of the web app
  setPathUrlStrategy();

  runApp(TinashaApp(settings));
}
