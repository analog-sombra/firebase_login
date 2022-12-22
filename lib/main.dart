import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';
import 'services/firebase.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final firebaseAppW = ref.watch(firebaseApp);
    return firebaseAppW.when(
      data: (data) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Login system',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routerConfig: router,
      ),
      error: (err, stack) => Center(
        child: Center(
          child: Text("Error: $err"),
        ),
      ),
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
