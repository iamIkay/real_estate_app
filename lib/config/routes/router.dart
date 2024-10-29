import 'package:go_router/go_router.dart';
import 'package:real_estate_app/config/routes/routes.dart';
import 'package:real_estate_app/wrappers/main_wrapper.dart';

import '../../features/splash_screen.dart';
import 'animate_route.dart';

class AppRouter {
  static final router = GoRouter(routes: [
    GoRoute(
        path: Routes.root,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
            child: const SplashScreen(), context: context, state: state)),
    GoRoute(
        path: Routes.wrapper,
        pageBuilder: (context, state) => buildPageWithDefaultTransition(
            child: const MainWrapper(), context: context, state: state)),
  ]);
}
