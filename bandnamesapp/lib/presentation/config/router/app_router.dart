import 'package:bandnamesapp/presentation/screens/home_screen.dart';
import 'package:bandnamesapp/presentation/screens/status.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  GoRouter getRouter() {
    final router = GoRouter(initialLocation: '/', routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/status',
        builder: (context, state) => const StatusScreen(),
      )
    ]);
    return router;
  }
}
