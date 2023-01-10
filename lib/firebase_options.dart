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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBTiEatQYdU9ELtCdjKVAhsIk9YhwgLsUk',
    appId: '1:592184472687:android:14a47e082c9fc56500899a',
    messagingSenderId: '592184472687',
    projectId: 'hall-of-legends',
    storageBucket: 'hall-of-legends.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB0RGuTqlULKjw7bhfoxKWl6RTv4hn0004',
    appId: '1:592184472687:ios:47b54380e75c47cb00899a',
    messagingSenderId: '592184472687',
    projectId: 'hall-of-legends',
    storageBucket: 'hall-of-legends.appspot.com',
    androidClientId: '592184472687-1tb9phdgh24dabukepia81f4qatek2c8.apps.googleusercontent.com',
    iosClientId: '592184472687-lde5tu5b0g9p6hlo7sgsilta9c9uptjr.apps.googleusercontent.com',
    iosBundleId: 'com.example.hof',
  );
}
