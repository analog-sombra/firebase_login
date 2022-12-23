import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/config/thems.dart';
import 'package:firebase_login/state/authState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../utils/custom.dart';

class UserPage extends HookConsumerWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GlobalKey<FormState> formKey =
        useMemoized(() => GlobalKey<FormState>());
    final appThemeW = ref.watch(apptheme);
    final height = MediaQuery.of(context).size.height;
    final topPadding = MediaQuery.of(context).viewPadding.top;
    ValueNotifier<String?> email = useState(null);
    ValueNotifier<String?> createdAt = useState(null);
    TextEditingController newPass = useTextEditingController();

    void init() async {
      email.value = FirebaseAuth.instance.currentUser!.email;
      createdAt.value =
          FirebaseAuth.instance.currentUser!.metadata.creationTime.toString();
    }

    useEffect(() {
      init();
      return null;
    }, []);

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
                  Image.asset("assets/images/login.png"),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      "Name",
                      textScaleFactor: 1,
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      email.value!,
                      textScaleFactor: 1,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: SizedBox(
                        width: 200,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: appThemeW.primaryColor,
                              shape: const StadiumBorder()),
                          onPressed: () async {
                            await ref.watch(appAuthState).signOut(context);
                          },
                          child: const Text(
                            "Logouts",
                            textScaleFactor: 1,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: InkWell(
                      onTap: () {
                        updatePassAlert(context, newPass, ref);
                      },
                      child: Text(
                        "Change password",
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
