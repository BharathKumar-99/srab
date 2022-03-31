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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCMW3__bZIiFisggg3e_TIVJow2QekWORI',
    appId: '1:932498122432:web:cfc8c8f0b3428f90d6af25',
    messagingSenderId: '932498122432',
    projectId: 'srab-3bb74',
    authDomain: 'srab-3bb74.firebaseapp.com',
    storageBucket: 'srab-3bb74.appspot.com',
    measurementId: 'G-PP899QGH0L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCsSO4E5lFp5mHvnYxRrRz1F_b6LeHmbRU',
    appId: '1:932498122432:android:2865f307c89dc07fd6af25',
    messagingSenderId: '932498122432',
    projectId: 'srab-3bb74',
    storageBucket: 'srab-3bb74.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBB2kDKdP4ZSF9WE-d1HptyxIZrjrQ-nLY',
    appId: '1:932498122432:ios:96c14a2834309566d6af25',
    messagingSenderId: '932498122432',
    projectId: 'srab-3bb74',
    storageBucket: 'srab-3bb74.appspot.com',
    iosClientId: '932498122432-61s2p5i0qi63uu18tpcsm1d6120inaos.apps.googleusercontent.com',
    iosBundleId: 'n',
  );
}