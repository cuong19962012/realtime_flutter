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
    apiKey: 'AIzaSyA0dBZLv0nX_vTFMxmTmtri3dmiEgKIHNQ',
    appId: '1:713231509322:android:c62d9dbf9ba0474df3c3b3',
    messagingSenderId: '713231509322',
    projectId: 'cncdb-2f4d0',
    databaseURL: 'https://cncdb-2f4d0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'cncdb-2f4d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCH8H37I0oCLCG_tlmqfLGZDdrEW0pgAaU',
    appId: '1:713231509322:ios:1c19659ccc11ce1af3c3b3',
    messagingSenderId: '713231509322',
    projectId: 'cncdb-2f4d0',
    databaseURL: 'https://cncdb-2f4d0-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'cncdb-2f4d0.appspot.com',
    iosBundleId: 'com.example.testRealtimeDatabase',
  );
}
