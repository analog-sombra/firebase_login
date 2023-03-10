// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBU3TB5TS0FA_EkyRUZu5VpANhhV57lUHg',
    appId: '1:856287010490:web:509350632f74df33b82c83',
    messagingSenderId: '856287010490',
    projectId: 'loginsytem-82f02',
    authDomain: 'loginsytem-82f02.firebaseapp.com',
    storageBucket: 'loginsytem-82f02.appspot.com',
    measurementId: 'G-K9JX2YNWZL',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAyAx_VUkuLI5QiCQ8eDbMvPVkseV4QJZE',
    appId: '1:856287010490:android:0f2bd693caf22ecbb82c83',
    messagingSenderId: '856287010490',
    projectId: 'loginsytem-82f02',
    storageBucket: 'loginsytem-82f02.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDvB5VvGw5glP5ZurXgfSGdBQS55OIXTis',
    appId: '1:856287010490:ios:0c074bd537ccfb44b82c83',
    messagingSenderId: '856287010490',
    projectId: 'loginsytem-82f02',
    storageBucket: 'loginsytem-82f02.appspot.com',
    iosClientId: '856287010490-8iinur3bijmso1mh1e7n5fdue1458gfo.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseLogin',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDvB5VvGw5glP5ZurXgfSGdBQS55OIXTis',
    appId: '1:856287010490:ios:0c074bd537ccfb44b82c83',
    messagingSenderId: '856287010490',
    projectId: 'loginsytem-82f02',
    storageBucket: 'loginsytem-82f02.appspot.com',
    iosClientId: '856287010490-8iinur3bijmso1mh1e7n5fdue1458gfo.apps.googleusercontent.com',
    iosBundleId: 'com.example.firebaseLogin',
  );
}
