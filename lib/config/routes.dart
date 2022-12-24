import 'package:firebase_login/config/router_utils.dart';
import 'package:firebase_login/views/error.dart';
import 'package:firebase_login/views/login.dart';
import 'package:firebase_login/views/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../services/appservices.dart';

// final GoRouter router = GoRouter(
//   initialLocation: "/",
//   routes: <GoRoute>[
//     GoRoute(
//       path: "/",
//       name: "login page",
//       builder: (BuildContext context, GoRouterState state) {
//         return const LoginPage();
//       },
//     ),
//     GoRoute(
//       path: "/signup",
//       name: "signup page",
//       builder: (BuildContext context, GoRouterState state) {
//         return const SignupPage();
//       },
//     ),
//     GoRoute(
//       path: "/user",
//       name: "user page",
//       builder: (BuildContext context, GoRouterState state) {
//         return const UserPage();
//       },
//     ),
//     GoRoute(
//       path: "/error",
//       name: "error page",
//       builder: (BuildContext context, GoRouterState state) {
//         return const ErrorPage(
//           error: "404 page not found.",
//         );
//       },
//     ),
//   ],
// );

class AppRouter {
  late final AppService appService;
  GoRouter get router => _goRouter;

  AppRouter(this.appService);

  late final GoRouter _goRouter = GoRouter(
    refreshListenable: appService,
    initialLocation: APP_PAGE.home.toPath,
    routes: <GoRoute>[
      GoRoute(
        path: APP_PAGE.home.toPath,
        name: APP_PAGE.home.toName,
        builder: (context, state) => const UserPage(),
      ),
      GoRoute(
        path: APP_PAGE.login.toPath,
        name: APP_PAGE.login.toName,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: APP_PAGE.error.toPath,
        name: APP_PAGE.error.toName,
        builder: (context, state) => ErrorPage(error: state.extra.toString()),
      ),
    ],
    errorBuilder: (context, state) => ErrorPage(error: state.error.toString()),
    redirect: (BuildContext context, GoRouterState state) {
      // return "/error";

      final String loginLocation = APP_PAGE.login.toPath;
      final String homeLocation = APP_PAGE.home.toPath;

      final isLogedIn = appService.loginState;
      final isInitialized = appService.initialized;

      final isGoingToLogin = state.subloc == loginLocation;

      // If not Initialized and not going to Initialized redirect to Splash
      // if (!isInitialized && !isGoingToInit) {
      //   return splashLocation;
      //   // If not onboard and not going to onboard redirect to OnBoarding
      // } else if (isInitialized && !isOnboarded && !isGoingToOnboard) {
      //   return onboardLocation;
      //   // If not logedin and not going to login redirect to Login
      // } else
      if (isInitialized && !isLogedIn && !isGoingToLogin) {
        return loginLocation;
        // If all the scenarios are cleared but still going to any of that screen redirect to Home
      } else if ((isLogedIn && isGoingToLogin) || isInitialized) {
        return homeLocation;
      } else {
        // Else Don't do anything
        return null;
      }
    },
  );
}
