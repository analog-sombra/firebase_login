import 'package:firebase_login/config/thems.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends HookConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeW = ref.watch(apptheme);
    final height = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).viewPadding.top;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: appThemeW.backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: height - topPadding,
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
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Color(0xff3c2d4a),
                        prefixIcon: Icon(
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
                        onPressed: () {},
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
                        return context.push("/signup");
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
    );
  }
}
