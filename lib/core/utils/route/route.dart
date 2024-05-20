import 'package:go_router/go_router.dart';
import 'package:todoapp/core/utils/route/magicroute.dart';
import 'package:todoapp/feature/auth/presentation/autho/views/login_view.dart';
import 'package:todoapp/feature/home/presentation/view/homeview.dart';

abstract class AppRouter {
  static const login = '/';
  static const home = '/home';

  static final router = GoRouter(
                navigatorKey: navigatorKey,

    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: home,
        builder: (context, state) => const HomeView(),
      ),
    ],
  );
}
