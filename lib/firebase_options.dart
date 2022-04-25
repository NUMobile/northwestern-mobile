// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars
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
    // ignore: missing_enum_constant_in_switch
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
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDLrQ8PF0wyQJddrg_f_qKyONrrSFVfI4k',
    appId: '1:67002914537:android:7f6159e6b39874e20f8278',
    messagingSenderId: '67002914537',
    projectId: 'nunplus-4f892',
    storageBucket: 'nunplus-4f892.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDKopGclczrqai8phUC4c6_ozGQ1X2blm4',
    appId: '1:67002914537:ios:17ccaa98a39f40590f8278',
    messagingSenderId: '67002914537',
    projectId: 'nunplus-4f892',
    storageBucket: 'nunplus-4f892.appspot.com',
    iosClientId: '67002914537-nes56hkse0gbjiqi16kov4tuq7sfq167.apps.googleusercontent.com',
    iosBundleId: 'com.kening.nplus.ios',
  );
}