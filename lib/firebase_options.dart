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
    apiKey: 'AIzaSyBBKnHEYwph-96xt02v9VXPzizDvjRu0Fc',
    appId: '1:170576643548:web:4d0f28957e22b4d5d97b19',
    messagingSenderId: '170576643548',
    projectId: 'sports-app-dff16',
    authDomain: 'sports-app-dff16.firebaseapp.com',
    storageBucket: 'sports-app-dff16.appspot.com',
    measurementId: 'G-Q7D7TWKQ12',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCz0gfgoV9pLH_12Y4YpmZ54WNBq6wAo6Y',
    appId: '1:170576643548:android:e11ede15369cd937d97b19',
    messagingSenderId: '170576643548',
    projectId: 'sports-app-dff16',
    storageBucket: 'sports-app-dff16.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAD28nM3B09WkHQ7Hod5Gk_Y3rSU0EesWw',
    appId: '1:170576643548:ios:70292292ec1e238ad97b19',
    messagingSenderId: '170576643548',
    projectId: 'sports-app-dff16',
    storageBucket: 'sports-app-dff16.appspot.com',
    iosBundleId: 'com.example.sportsApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAD28nM3B09WkHQ7Hod5Gk_Y3rSU0EesWw',
    appId: '1:170576643548:ios:70292292ec1e238ad97b19',
    messagingSenderId: '170576643548',
    projectId: 'sports-app-dff16',
    storageBucket: 'sports-app-dff16.appspot.com',
    iosBundleId: 'com.example.sportsApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBBKnHEYwph-96xt02v9VXPzizDvjRu0Fc',
    appId: '1:170576643548:web:264a1fa79fb06123d97b19',
    messagingSenderId: '170576643548',
    projectId: 'sports-app-dff16',
    authDomain: 'sports-app-dff16.firebaseapp.com',
    storageBucket: 'sports-app-dff16.appspot.com',
    measurementId: 'G-2RK6KH6HDE',
  );
}