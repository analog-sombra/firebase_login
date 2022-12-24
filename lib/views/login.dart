// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_login/config/thems.dart';
import 'package:firebase_login/state/authState.dart';
import 'package:firebase_login/views/signup.dart';
import 'package:firebase_login/views/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/custom.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey =
        useMemoized(() => GlobalKey<FormState>());
    final appThemeW = ref.watch(apptheme);
    final height = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).viewPadding.top;
    TextEditingController email = useTextEditingController();
    TextEditingController password = useTextEditingController();
    TextEditingController reset = useTextEditingController();
    ValueNotifier<bool> isLoading = useState(false);
    ValueNotifier<bool> isShowPass = useState(false);
    void init() async {
      bool login = await ref.watch(appAuthState).getLogin(context);
      if (login) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const UserPage()),
            (route) => false);
      }
    }

    useEffect(() {
      init();
      return null;
    });

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: appThemeW.backgroundColor,
      body: isLoading.value
          ? const Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            )
          : SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: height - topPadding,
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset("assets/images/login.png"),
                        const Spacer(),
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Login",
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
                            "Please signin to continue.",
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
                              controller: email,
                              validator: (value) {
                                if (value == null ||
                                    value == "" ||
                                    value.isEmpty) {
                                  return "Enter the email address";
                                } else if (!RegExp(
                                        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                    .hasMatch(value)) {
                                  return "Your email is not valid, Try again...";
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                filled: true,
                                prefixIcon: Icon(
                                  Icons.mail_outline,
                                  color: Colors.white,
                                ),
                                fillColor: Color(0xff3c2d4a),
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
                              obscureText: !isShowPass.value,
                              validator: (value) {
                                if (value == null ||
                                    value == "" ||
                                    value.isEmpty) {
                                  return "Enter the password";
                                }
                                return null;
                              },
                              style: const TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                suffixIcon: InkWell(
                                  onTap: () {
                                    isShowPass.value = !isShowPass.value;
                                  },
                                  child: Icon(
                                    isShowPass.value
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined,
                                    color: Colors.white,
                                  ),
                                ),
                                filled: true,
                                fillColor: const Color(0xff3c2d4a),
                                prefixIcon: const Icon(
                                  Icons.key_outlined,
                                  color: Colors.white,
                                ),
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
                                onPressed: () async {
                                  isLoading.value = true;
                                  if (formKey.currentState!.validate()) {
                                    try {
                                      await ref.watch(appAuthState).login(
                                          context,
                                          email.text.trim(),
                                          password.text.trim());
                                    } catch (e) {
                                      log(e.toString());
                                    }
                                  }
                                  isLoading.value = false;
                                },
                                child: const Text(
                                  "Login",
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
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: InkWell(
                            onTap: () {
                              resetPassAlert(context, reset, ref);
                            },
                            child: Center(
                              child: Text(
                                "forget password",
                                textScaleFactor: 1,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: appThemeW.primaryColor,
                                  fontWeight: FontWeight.w400,
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
                              "Don't have an account?",
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
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignupPage(),
                                  ),
                                );
                              },
                              child: Text(
                                "Sign up",
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
