// ignore_for_file: use_build_context_synchronously

import 'dart:ui';

import 'package:firebase_login/config/thems.dart';
import 'package:firebase_login/state/authState.dart';
import 'package:firebase_login/utils/utilsfunction.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void alert(BuildContext context, Color backgroundColor, String title) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: backgroundColor,
      content: Text(
        title,
        textScaleFactor: 1,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),
    ),
  );
}

class CusBtn extends HookWidget {
  final Color btnColor;
  final String btnText;
  final double textSize;
  final Function btnFunction;
  final double btnRadius;
  final Color textColor;
  final double elevation;
  const CusBtn({
    Key? key,
    required this.btnColor,
    required this.btnText,
    required this.textSize,
    required this.btnFunction,
    this.btnRadius = 10,
    this.textColor = Colors.white,
    this.elevation = 2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(elevation),
        backgroundColor: MaterialStateProperty.all(btnColor),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(btnRadius)),
        ),
        minimumSize: MaterialStateProperty.all(const Size.fromHeight(40)),
      ),
      onPressed: () {
        btnFunction();
      },
      child: Text(
        btnText,
        textAlign: TextAlign.center,
        style: TextStyle(color: textColor, fontSize: textSize),
      ),
    );
  }
}

void resetPassAlert(
    BuildContext context, TextEditingController email, WidgetRef ref) async {
  final formKey = GlobalKey<FormState>();
  return await showDialog(
    context: context,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        contentPadding: const EdgeInsets.all(5),
        backgroundColor: ref.watch(apptheme).backgroundColor,
        content: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Restore Password",
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return 'Please enter email address';
                        } else if (!RegExp(
                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                            .hasMatch(value)) {
                          return "Enter a valid email.";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff3c2d4a),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "Enter email..",
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.45),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CusBtn(
                        btnColor: Colors.red,
                        btnText: "Cencel",
                        textSize: 18,
                        btnFunction: () {
                          Navigator.pop(context);
                          email.clear();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CusBtn(
                        btnColor: Colors.green,
                        btnText: "Send",
                        textSize: 18,
                        btnFunction: () async {
                          if (formKey.currentState!.validate()) {
                            await ref
                                .watch(appAuthState)
                                .resetPassword(context, email.text);
                            context.pop();

                            email.clear();
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

void updatePassAlert(
    BuildContext context, TextEditingController email, WidgetRef ref) async {
  final formKey = GlobalKey<FormState>();
  return await showDialog(
    context: context,
    builder: (context) => BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: AlertDialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16.0))),
        contentPadding: const EdgeInsets.all(5),
        backgroundColor: ref.watch(apptheme).backgroundColor,
        content: Container(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  "Update Password",
                  textScaleFactor: 1,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: TextFormField(
                      style: const TextStyle(color: Colors.white),
                      controller: email,
                      validator: (value) {
                        if (value == null || value.isEmpty || value == "") {
                          return 'Please enter email address';
                        } else if (value.contains(" ")) {
                          return "Email connot containes space";
                        } else if (!validatePassword(value)) {
                          return "Enter a valid password";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xff3c2d4a),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintText: "New Password..",
                        hintStyle: TextStyle(
                          color: Colors.white.withOpacity(0.45),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: CusBtn(
                        btnColor: Colors.red,
                        btnText: "Cencel",
                        textSize: 18,
                        btnFunction: () {
                          Navigator.pop(context);
                          email.clear();
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: CusBtn(
                        btnColor: Colors.green,
                        btnText: "Update",
                        textSize: 18,
                        btnFunction: () async {
                          if (formKey.currentState!.validate()) {
                            await ref
                                .watch(appAuthState)
                                .updatePassword(context, email.text);
                            context.pop();

                            email.clear();
                          }
                        },
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
