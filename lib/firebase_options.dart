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
    apiKey: 'AIzaSyAlhLikbQZNPOfHiXBNVAXwnEXeakbOkrI',
    appId: '1:313593987117:web:bddab2b93031477ab238a4',
    messagingSenderId: '313593987117',
    projectId: 'piddle-rolebased',
    authDomain: 'piddle-rolebased.firebaseapp.com',
    storageBucket: 'piddle-rolebased.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4M3s_de0fJiG4AO1jhIcZacQINtG--7A',
    appId: '1:313593987117:android:9780c485018c5741b238a4',
    messagingSenderId: '313593987117',
    projectId: 'piddle-rolebased',
    storageBucket: 'piddle-rolebased.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAfkxEjfcE2htnG5aKh83Mv-zm62zttNp8',
    appId: '1:313593987117:ios:561bc943b654d4efb238a4',
    messagingSenderId: '313593987117',
    projectId: 'piddle-rolebased',
    storageBucket: 'piddle-rolebased.appspot.com',
    iosClientId: '313593987117-ig8q4h6pib54v07g952ur3ehkaq7h5l2.apps.googleusercontent.com',
    iosBundleId: 'com.example.piddleRolebased',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAfkxEjfcE2htnG5aKh83Mv-zm62zttNp8',
    appId: '1:313593987117:ios:561bc943b654d4efb238a4',
    messagingSenderId: '313593987117',
    projectId: 'piddle-rolebased',
    storageBucket: 'piddle-rolebased.appspot.com',
    iosClientId: '313593987117-ig8q4h6pib54v07g952ur3ehkaq7h5l2.apps.googleusercontent.com',
    iosBundleId: 'com.example.piddleRolebased',
  );
}
