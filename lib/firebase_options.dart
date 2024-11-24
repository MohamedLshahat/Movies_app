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
    apiKey: 'AIzaSyAY6luJ5sggGsJJigcHOylaw7XwlJ7oJ7c',
    appId: '1:201749587943:web:0780bfac0468664d2bff42',
    messagingSenderId: '201749587943',
    projectId: 'movies-app-1024',
    authDomain: 'movies-app-1024.firebaseapp.com',
    storageBucket: 'movies-app-1024.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCU5RlVl_UZy_6uc8GVRqvcNOFK3RQeAIk',
    appId: '1:201749587943:android:258af8b3d40008ba2bff42',
    messagingSenderId: '201749587943',
    projectId: 'movies-app-1024',
    storageBucket: 'movies-app-1024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAwpbrtMz6niPKelhIgR7RiII01Thv_2xo',
    appId: '1:201749587943:ios:603d5e526ce84c1a2bff42',
    messagingSenderId: '201749587943',
    projectId: 'movies-app-1024',
    storageBucket: 'movies-app-1024.appspot.com',
    iosBundleId: 'com.example.movies',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAwpbrtMz6niPKelhIgR7RiII01Thv_2xo',
    appId: '1:201749587943:ios:603d5e526ce84c1a2bff42',
    messagingSenderId: '201749587943',
    projectId: 'movies-app-1024',
    storageBucket: 'movies-app-1024.appspot.com',
    iosBundleId: 'com.example.movies',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAY6luJ5sggGsJJigcHOylaw7XwlJ7oJ7c',
    appId: '1:201749587943:web:5dd0c7aa4c2606142bff42',
    messagingSenderId: '201749587943',
    projectId: 'movies-app-1024',
    authDomain: 'movies-app-1024.firebaseapp.com',
    storageBucket: 'movies-app-1024.appspot.com',
  );
}
