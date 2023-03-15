import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shaawl/classes/dashboard/dashboard.dart';
// import 'package:shaawl/classes/single_chat/single_chat.dart';

import 'package:firebase_messaging/firebase_messaging.dart';

import 'firebase_options.dart';

RemoteMessage? initialMessage;
FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // show notification alert ( banner )
  NotificationSettings settings = await firebaseMessaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (kDebugMode) {
    print('User granted permission =====> ${settings.authorizationStatus}');
  }
  //
  //
  final token = await firebaseMessaging.getToken();

  //
  //
  if (kDebugMode) {
    print('=============> HERE IS MY DEVICE TOKEN <=============');
    print('======================================================');
    print(token);
    print('======================================================');
    print('======================================================');
  }

// background access
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // foreground access
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardScreen(),
    ),
  );
}

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (kDebugMode) {
    print("Handling a background message: ${message.messageId}");
  }
}
