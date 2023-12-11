import 'package:chat_app/config/router/services/animation_helper.dart';
import 'package:chat_app/presentation/screens/screens.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(initialLocation: '/login', routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: '/login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: '/register',
    pageBuilder: (context, state) => slideHorizontalTransition(context: context, state: state, child: const RegisterScreen()),
  ),
  GoRoute(
    path: '/chat/:id',
    builder: (context, state) => const ChatScreen(),
  ),
  GoRoute(
    path: '/users',
    builder: (context, state) => const UsersScreen(),
  ),
  // GoRoute(
  //   path: '/settings',
  //   builder: (context, state) => const SettingsScreen(),
  // ),
  // GoRoute(
  //   path: '/change_info',
  //   builder: (context, state) => const ChangeInfoScreen(),
  // ),
  // GoRoute(
  //   path: '/search',
  //   builder: (context, state) => const SearchCardScreen(),
  // ),
  // GoRoute(
  //   path: '/card/:id',
  //   builder: (context, state) {
  //     final cardID = state.pathParameters['id'] ?? 'no-id';
  //     return CardScreen(cardID: cardID);
  //   },
  // ),
  // GoRoute(
  //   path: '/user/:uid',
  //   builder: (context, state) {
  //     final userUID = state.pathParameters['uid'] ?? 'no-uid';
  //     return UserScreen(userUID: userUID);
  //   },
  // ),
]);
