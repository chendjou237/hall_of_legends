import 'package:go_router/go_router.dart';
import 'package:hall_of_fame/app/features/main/view/splash_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/main/view/main_view.dart';

///
/// for getting routers that are present in the app
///
final routerProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      // TODO: add your router here
      routes: [
        /// for showing onboarding
        GoRoute(
            path: SplashView.routeName,
            builder: (context, state) => const SplashView()),
        GoRoute(
          path: MainView.routeName,
          builder: (context, state) => const MainView(),
        ),
      ],
    );
  },
);
