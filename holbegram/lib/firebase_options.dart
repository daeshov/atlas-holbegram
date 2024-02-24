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
    apiKey: 'AIzaSyCiDoTGUJW8tune0bC3ei2JUzd-qt9bK58',
    appId: '1:294555666011:web:f2280ad6f410953a27a17e',
    messagingSenderId: '294555666011',
    projectId: 'holbegram-9d269',
    authDomain: 'holbegram-9d269.firebaseapp.com',
    storageBucket: 'holbegram-9d269.appspot.com',
    measurementId: 'G-5CRR4KTL92',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDxp1rDrgtN7GhebhDF2Yxz6PEkqP1S60Y',
    appId: '1:294555666011:android:073b46322dd15a6727a17e',
    messagingSenderId: '294555666011',
    projectId: 'holbegram-9d269',
    storageBucket: 'holbegram-9d269.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBiMKUhUlhVKUDJ5TmXx6OdZAYE0V05U7c',
    appId: '1:294555666011:ios:d1a54c625a1c56ac27a17e',
    messagingSenderId: '294555666011',
    projectId: 'holbegram-9d269',
    storageBucket: 'holbegram-9d269.appspot.com',
    iosClientId: '294555666011-afnif340lgcckbbes6bcn41co5djss89.apps.googleusercontent.com',
    iosBundleId: 'com.example.holbegram',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBiMKUhUlhVKUDJ5TmXx6OdZAYE0V05U7c',
    appId: '1:294555666011:ios:5f232ebcbc16a08027a17e',
    messagingSenderId: '294555666011',
    projectId: 'holbegram-9d269',
    storageBucket: 'holbegram-9d269.appspot.com',
    iosClientId: '294555666011-lavcjbrpl4mmiikcr7pmunreri94abch.apps.googleusercontent.com',
    iosBundleId: 'com.example.holbegram.RunnerTests',
  );
}