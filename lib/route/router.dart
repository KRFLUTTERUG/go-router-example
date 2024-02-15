import 'package:go_router/go_router.dart';
import 'package:gorouter/screen/1_basic_screen.dart';
import 'package:gorouter/screen/2_named_screen.dart';
import 'package:gorouter/screen/3_push_screen.dart';
import 'package:gorouter/screen/root_screen.dart';

final router = GoRouter(routes: [
  GoRoute(
      path: '/',
      builder: (context, state) {
        return RootScreen();
      },
      routes: [
        GoRoute(
            path: 'basic',
            builder: (context, state) {
              return BasicScreen();
            }),
        GoRoute(
            path: 'named',
            name: 'named_screen',
            builder: (context, state) {
              return NamedScreen();
            }),
        GoRoute(
            path: 'push',
            name: 'push_screen',
            builder: (context, state) {
              return PushScreen();
            })
      ])
]);
