import 'package:go_router/go_router.dart';
import 'package:tinasha_v2/routes/routes.dart';
import 'package:tinasha_v2/widgets/home_shell.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    ShellRoute(
      builder: (context, state, child) => HomeShell(child: child),
      routes: <RouteBase>[
        GoRoute(
          path: '/',
          builder: (context, state) => const HomeRoute(),
        ),
        GoRoute(
          path: '/list',
          builder: (context, state) => const ListRoute(),
        ),
        GoRoute(
          path: '/profile',
          builder: (context, state) => const ProfileRoute(),
        ),
      ],
    ),
    GoRoute(
      path: '/search',
      builder: (context, state) => const SearchRoute(),
    ),
    GoRoute(
      path: '/sign-in',
      builder: (context, state) => const SignInRoute(),
    ),
  ],
);
