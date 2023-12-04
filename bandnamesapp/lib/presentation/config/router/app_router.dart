import 'package:bandnamesapp/presentation/screens/home_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter getRouter() {
    final router = GoRouter(initialLocation: '/', routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      )
    ]);
    return router;
  }
}
