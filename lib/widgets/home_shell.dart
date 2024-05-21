import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeNavigationRail extends StatelessWidget {
  const HomeNavigationRail({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int? selectedIndex;
  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: Theme.of(context).navigationBarTheme.backgroundColor,
      labelType: NavigationRailLabelType.selected,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const <NavigationRailDestination>[
        NavigationRailDestination(
          selectedIcon: Icon(Icons.event),
          icon: Icon(Icons.event_outlined),
          label: Text('Season'),
        ),
        NavigationRailDestination(
          selectedIcon: Icon(Icons.view_list),
          icon: Icon(Icons.view_list_outlined),
          label: Text('List'),
        ),
        NavigationRailDestination(
          selectedIcon: Icon(Icons.person),
          icon: Icon(Icons.person_outline),
          label: Text('Profile'),
        ),
      ],
    );
  }
}

class HomeNavigationBar extends StatelessWidget {
  const HomeNavigationBar({
    required this.selectedIndex,
    required this.onDestinationSelected,
    super.key,
  });

  final int selectedIndex;
  final void Function(int)? onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
      selectedIndex: selectedIndex,
      onDestinationSelected: onDestinationSelected,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.event),
          icon: Icon(Icons.event_outlined),
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
    );
  }
}

class HomeShell extends StatelessWidget {
  const HomeShell({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return Scaffold(
      body: Row(
        children: [
          if (orientation == Orientation.landscape)
            HomeNavigationRail(
              selectedIndex: _calculateSelectedIndex(context),
              onDestinationSelected: (idx) => _onItemTapped(idx, context),
            ),
          Expanded(child: child),
        ],
      ),
      bottomNavigationBar: orientation == Orientation.portrait
          ? HomeNavigationBar(
              selectedIndex: _calculateSelectedIndex(context),
              onDestinationSelected: (idx) => _onItemTapped(idx, context),
            )
          : null,
    );
  }

  static int _calculateSelectedIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.path;
    switch (location) {
      case '/':
        return 0;
      case '/list':
        return 1;
      case '/profile':
        return 2;
      default:
        return 0;
    }
  }

  void _onItemTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        GoRouter.of(context).go('/');
      case 1:
        GoRouter.of(context).go('/list');
      case 2:
        GoRouter.of(context).go('/profile');
    }
  }
}
