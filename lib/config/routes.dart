import 'package:firebase_login/views/login.dart';
import 'package:firebase_login/views/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../views/signup.dart';

final GoRouter router = GoRouter(
  initialLocation: "/",
  routes: <GoRoute>[
    GoRoute(
      path: "/",
      name: "login page",
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: "/signup",
      name: "signup page",
      builder: (BuildContext context, GoRouterState state) {
        return const SignupPage();
      },
    ),
    GoRoute(
      path: "/user",
      name: "user page",
      builder: (BuildContext context, GoRouterState state) {
        return const UserPage();
      },
    ),
  ],
);
