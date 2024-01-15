import 'package:go_router/go_router.dart';
import 'package:ny_news/presentation/news_main_screen.dart';

import 'app_routes.dart';

const String mainNewsPath = '/mainNews';

class AppRouter {
  GoRouter router = GoRouter(
    initialLocation: mainNewsPath,
    routes: [
      ShellRoute(
        builder: (context, state, child) => const NewsMainScreen(),
        routes: [
          GoRoute(
            name: AppRoutes.mainNewsRoute,
            path: mainNewsPath,
            pageBuilder: (context, state) => const NoTransitionPage(
              child: NewsMainScreen(),
            ),
          ),
        ],
      )
    ],
  );
}
