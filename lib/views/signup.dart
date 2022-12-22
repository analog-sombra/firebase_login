import 'package:firebase_login/config/thems.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/utilsfunction.dart';

class SignupPage extends HookConsumerWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey =
        useMemoized(() => GlobalKey<FormState>());

    TextEditingController name = useTextEditingController();
    TextEditingController email = useTextEditingController();
    TextEditingController number = useTextEditingController();
    TextEditingController password = useTextEditingController();
    TextEditingController rePassword = useTextEditingController();
    final appThemeW = ref.watch(apptheme);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).viewPadding.top;
    return Scaffold(
      backgroundColor: appThemeW.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: height - topPadding,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: IconButton(
                      onPressed: () {
                        context.pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Create account",
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Please fill the input below here.",
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        validator: (value) {
                          if (value == null || value == "" || value.isEmpty) {
                            return "Fill the name field";
                          } else if (value.length < 2 || value.length > 20) {
                            return "Name should be greater then 2 and lower then 20";
                          }
                          return null;
                        },
                        controller: name,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xff3c2d4a),
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          labelText: "Name",
                          labelStyle: TextStyle(color: Colors.white),
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        controller: email,
                        validator: (value) {
                          if (value == null || value == "" || value.isEmpty) {
                            return "Enter the email address";
                          } else if (!RegExp(
                                  r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                              .hasMatch(value)) {
                            return "Your email is not valid, Try again...";
                          } else if (value.contains(" ")) {
                            return "Email connot containes space";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xff3c2d4a),
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                          labelText: "Email",
                          labelStyle: TextStyle(color: Colors.white),
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        controller: number,
                        keyboardType: TextInputType.number,
                        validator: (value) {
                          if (value == null || value == "" || value.isEmpty) {
                            return "Enter the email address";
                          } else if (value.length != 10) {
                            return "Enter 10 degit valid phone number";
                          } else if (value.contains(" ")) {
                            return "Email connot containes space";
                          }
                          return null;
                        },
                        maxLength: 10,
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          counterText: "",
                          filled: true,
                          fillColor: Color(0xff3c2d4a),
                          prefixIcon: Icon(
                            Icons.smartphone,
                            color: Colors.white,
                          ),
                          labelText: "Number",
                          labelStyle: TextStyle(color: Colors.white),
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        controller: password,
                        validator: (value) {
                          if (value == null || value == "" || value.isEmpty) {
                            return "Enter the password";
                          } else if (value.contains(" ")) {
                            return "Email connot containes space";
                          } else if (!validatePassword(value)) {
                            return "Enter a valid password";
                          } else if (value != rePassword.text) {
                            return "Passwrod and rePassword should be same.";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xff3c2d4a),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                          labelText: "Password",
                          labelStyle: TextStyle(color: Colors.white),
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: TextFormField(
                        controller: rePassword,
                        validator: (value) {
                          if (value == null || value == "" || value.isEmpty) {
                            return "Enter the password";
                          } else if (value.contains(" ")) {
                            return "Email connot containes space";
                          } else if (!validatePassword(value)) {
                            return "Enter a valid password";
                          }
                          return null;
                        },
                        style: const TextStyle(color: Colors.white),
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Color(0xff3c2d4a),
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.white,
                          ),
                          labelText: "Re-Password",
                          labelStyle: TextStyle(color: Colors.white),
                          errorBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: appThemeW.primaryColor,
                              shape: const StadiumBorder()),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {}
                          },
                          child: const Text(
                            "Sign In",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const Text(
                        "Already have an account?",
                        textScaleFactor: 1,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          context.pop();
                        },
                        child: Text(
                          "Sign in",
                          textScaleFactor: 1,
                          style: TextStyle(
                              fontSize: 14,
                              color: appThemeW.primaryColor,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
