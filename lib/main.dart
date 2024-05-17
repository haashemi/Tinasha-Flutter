import 'package:flutter/material.dart';
import 'app/list.dart';
import 'app/seasonal.dart';
import 'app/profile.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _defaultLightColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue);

  final _defaultDarkColorScheme =
      ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.dark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tinasha',
      theme: ThemeData(
        colorScheme: _defaultLightColorScheme,
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: _defaultDarkColorScheme,
        useMaterial3: true,
      ),
      home: const MyHomePage(),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: <Widget>[
        const SeasonalScreen(),
        const ListScreen(),
        const ProfileScreen(),
      ][_currentPageIndex],
      bottomNavigationBar: NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
        selectedIndex: _currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentPageIndex = index;
          });
        },
        destinations: const <Widget>[
          NavigationDestination(
            selectedIcon: Icon(Icons.calendar_month),
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Season',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.view_list),
            icon: Icon(Icons.view_list_outlined),
            label: 'List',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.person),
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
