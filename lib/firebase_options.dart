// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyBu5Wdf5tF2Q2XE8NUXuRrt4oiEamjS2Yk',
    appId: '1:505832996748:web:b722086d9b1e59fd0ca0a9',
    messagingSenderId: '505832996748',
    projectId: 'testingdata-e221d',
    authDomain: 'testingdata-e221d.firebaseapp.com',
    storageBucket: 'testingdata-e221d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB2sbKzPGS4GWPzqdMMiASvG4WmTv1t4To',
    appId: '1:505832996748:android:17f496f3004edd080ca0a9',
    messagingSenderId: '505832996748',
    projectId: 'testingdata-e221d',
    storageBucket: 'testingdata-e221d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAhW9aoIxNWsP3hraTtdFKw2552c0bjvkQ',
    appId: '1:505832996748:ios:e34d3daae0280a520ca0a9',
    messagingSenderId: '505832996748',
    projectId: 'testingdata-e221d',
    storageBucket: 'testingdata-e221d.appspot.com',
    iosBundleId: 'com.example.demoWebs',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAhW9aoIxNWsP3hraTtdFKw2552c0bjvkQ',
    appId: '1:505832996748:ios:e34d3daae0280a520ca0a9',
    messagingSenderId: '505832996748',
    projectId: 'testingdata-e221d',
    storageBucket: 'testingdata-e221d.appspot.com',
    iosBundleId: 'com.example.demoWebs',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBu5Wdf5tF2Q2XE8NUXuRrt4oiEamjS2Yk',
    appId: '1:505832996748:web:37dd3703791e96f80ca0a9',
    messagingSenderId: '505832996748',
    projectId: 'testingdata-e221d',
    authDomain: 'testingdata-e221d.firebaseapp.com',
    storageBucket: 'testingdata-e221d.appspot.com',
  );
}
