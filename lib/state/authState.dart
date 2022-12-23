// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/utils/custom.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final appAuthState =
    ChangeNotifierProvider.autoDispose<AppAuthState>((ref) => AppAuthState());

class AppAuthState extends ChangeNotifier {
  FirebaseAuth appAuth = FirebaseAuth.instance;
  Future<void> register(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await appAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      log(userCredential.toString());
      alert(context, Colors.green, "Registered sucessfully. Logged In.");
      context.go("/");
    } on FirebaseException catch (e) {
      if (e.code == "weak-password") {
        alert(context, Colors.red, "Password provided is too weak.");
      } else if (e.code == "email-already-in-use") {
        alert(context, Colors.red, "Account Alreday exists.");
      } else {
        log(e.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> login(
      BuildContext context, String email, String password) async {
    try {
      UserCredential userCredential = await appAuth.signInWithEmailAndPassword(
          email: email, password: password);
      log(userCredential.toString());
      alert(context, Colors.green, "Login sucessfully.");
      context.go("/user");
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        alert(context, Colors.red, "User not found for this $email");
      } else if (e.code == 'wrong-password') {
        alert(context, Colors.red, "Wrong password. Try again");
      }
    }
  }

  Future<void> signOut(BuildContext context) async {
    await appAuth.signOut();
    context.go("/");
  }

  Future<void> resetPassword(BuildContext context, String email) async {
    try {
      log(email.toString());
      await appAuth.sendPasswordResetEmail(email: email);
      alert(context, Colors.green, "Reset email has been sent");
    } on FirebaseException catch (e) {
      if (e.code == "user-no-found") {
        alert(context, Colors.red, "No user found for this $email");
      } else {
        log(e.toString());
      }
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updatePassword(BuildContext context, String newPassword) async {
    try {
      final currentUser =
          await appAuth.currentUser!.updatePassword(newPassword);
      await signOut(context);
      alert(context, Colors.green, "Reset email has been sent");
      context.go("/");
    } on FirebaseException catch (e) {
      if (e.code == "user-no-found") {
        alert(context, Colors.red, "Unable to set new password.");
      }
    }
  }
}
