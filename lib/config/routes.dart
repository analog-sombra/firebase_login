import 'package:firebase_login/views/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

import '../views/signup.dart';

final GoRouter router = GoRouter(
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
  ],
);
