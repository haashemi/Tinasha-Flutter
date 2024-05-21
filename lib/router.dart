import 'package:go_router/go_router.dart';
import 'package:tinasha_v2/routes/routes.dart';
import 'package:tinasha_v2/widgets/home_shell.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  overridePlatformDefaultLocation: true,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) =>
          HomeShell(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: HomeRoute()),
        ),
        GoRoute(
          path: '/list',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ListRoute()),
        ),
        GoRoute(
          path: '/profile',
          pageBuilder: (context, state) =>
              const NoTransitionPage(child: ProfileRoute()),
        ),
      ],
    ),
    GoRoute(
      path: '/search',
      pageBuilder: (context, state) =>
          const NoTransitionPage(child: SearchRoute()),
    ),
  ],
);
