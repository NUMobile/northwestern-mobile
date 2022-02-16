import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

FirebaseFirestore firestore = FirebaseFirestore.instance;
FirebaseAuth auth = FirebaseAuth.instance;
// firebase_storage.FirebaseStorage storage =
//     firebase_storage.FirebaseStorage.instance;
FirebaseMessaging messaging = FirebaseMessaging.instance;
FirebaseAnalytics analytics = FirebaseAnalytics.instance;
FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;

/// Maps a [AuthorizationStatus] to a string value.
const statusMap = {
  AuthorizationStatus.authorized: 'Authorized',
  AuthorizationStatus.denied: 'Denied',
  AuthorizationStatus.notDetermined: 'Not Determined',
  AuthorizationStatus.provisional: 'Provisional',
};
