import 'package:firebase_login/config/thems.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ErrorPage extends HookConsumerWidget {
  const ErrorPage({super.key, required this.error});
  final String error;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeW = ref.watch(apptheme);
    return Scaffold(
      backgroundColor: appThemeW.backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: FittedBox(
            child: Text(
              error,
              textAlign: TextAlign.center,
              textScaleFactor: 1,
              style: const TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
