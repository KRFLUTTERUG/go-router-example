import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';
import 'package:gorouter/screen/10_transition_screen_1.dart';
import 'package:gorouter/screen/10_transition_screen_2.dart';
import 'package:gorouter/screen/1_basic_screen.dart';
import 'package:gorouter/screen/2_named_screen.dart';
import 'package:gorouter/screen/3_push_screen.dart';
import 'package:gorouter/screen/4_pop_base_screen.dart';
import 'package:gorouter/screen/5_pop_return_screen.dart';
import 'package:gorouter/screen/6_path_param_screen.dart';
import 'package:gorouter/screen/7_query_param_screen.dart';
import 'package:gorouter/screen/8_nested_child_screen.dart';
import 'package:gorouter/screen/8_nested_screen.dart';
import 'package:gorouter/screen/9_login_screen.dart';
import 'package:gorouter/screen/9_private_screen.dart';
import 'package:gorouter/screen/root_screen.dart';

// true = Login 됨 / false = Login 안됨
bool authState = false;

final router = GoRouter(
    redirect: (context, state) {
      // return string (path) -> 해당 라우트로 이동한다 (path)
      // return null -> 원래 이동하려던 라우트로 이동한다.
      if (state.location == '/login/private' && !authState) {
        return '/login';
      }

      return null;
    },
    routes: [
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
                }),
            GoRoute(
                path: 'pop',
                name: 'pop_base_screen',
                builder: (context, state) {
                  return PopBaseScreen();
                },
                routes: [
                  GoRoute(
                      path: 'return',
                      builder: (context, state) {
                        return PopReturnScreen();
                      })
                ]),
            GoRoute(
                path: 'path_param/:id',
                builder: (context, state) {
                  return PathParamScreen();
                },
                routes: [
                  GoRoute(
                      path: ':name',
                      builder: (context, state) {
                        return PathParamScreen();
                      })
                ]),
            GoRoute(
                path: 'query_param',
                builder: (context, state) {
                  return QueryParamScreen();
                }),
            ShellRoute(
                builder: (context, state, child) {
                  return NestedScreen(child: child);
                },
                routes: [
                  GoRoute(
                      path: 'nested/a',
                      builder: (_, state) =>
                          NestedChildScreen(routeName: '/nested/a')),
                  GoRoute(
                      path: 'nested/b',
                      builder: (_, state) =>
                          NestedChildScreen(routeName: '/nested/b')),
                  GoRoute(
                      path: 'nested/c',
                      builder: (_, state) =>
                          NestedChildScreen(routeName: '/nested/c'))
                ]),
            GoRoute(
                path: 'login',
                builder: (_, state) => LoginScreen(),
                routes: [
                  GoRoute(
                      path: 'private', builder: (_, state) => PrivateScreen())
                ]),
            GoRoute(
                path: 'login2',
                builder: (_, state) => LoginScreen(),
                routes: [
                  GoRoute(
                      path: 'private',
                      builder: (_, state) => PrivateScreen(),
                      redirect: (context, state) {
                        if (!authState) {
                          return '/login2';
                        }
                        return null;
                      })
                ]),
            GoRoute(
                path: 'transition',
                builder: (context, state) => TransitionScreenOne(),
                routes: [
                  GoRoute(
                      path: 'detail',
                      pageBuilder: (_, state) => CustomTransitionPage(child: TransitionScreenTwo(),
                          transitionDuration: Duration(seconds: 3),
                          transitionsBuilder: (context, animation, secondaryAnimation, child){
                        return FadeTransition(opacity: animation, child: child,); // ScaleTransition, RotateTransition
                      })
                  )]),
          ]),
    ]);
