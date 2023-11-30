import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_bloc_tests/main.dart';
import 'package:flutter_bloc_tests/notificationTests/presentation/notificationScreen.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
  print('Body: ${message.notification?.body}');
  print('Payload: ${message.data}');
}

final _localNotifications = FlutterLocalNotificationsPlugin();

final _androidChannel = AndroidNotificationChannel(
    'high_importance_channel', 'High Importance Notifications',
    description: 'This channel is used for important notifications',
    importance: Importance.defaultImportance);

void handleMessage(RemoteMessage? message) {
  if (message == null) return;

  navigatorKey.currentState
      ?.pushNamed(NotificationScreen.route, arguments: message);
}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true, sound: true, badge: true);

  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
  FirebaseMessaging.onMessage.listen((message) {
    final notification = message.notification;
    if (notification == null) return;
    _localNotifications.show(
        notification.hashCode,
        notification.title,
        notification.body,
        NotificationDetails(
            android: AndroidNotificationDetails(
                _androidChannel.id, _androidChannel.name,
                channelDescription: _androidChannel.description,
                icon: '@drawable/ic_launcher')),
        payload: jsonEncode(message.toMap()));
  });
  final platform = _localNotifications.resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>();
  await platform?.createNotificationChannel(_androidChannel);
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future initLocalNotifications() async {
    const iOS = DarwinInitializationSettings();
    const android = AndroidInitializationSettings('@drawable/ic_launcher');
    const settings = InitializationSettings(android: android, iOS: iOS);

    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: (noti) {
      final message = RemoteMessage.fromMap(jsonDecode(noti.payload!));
      handleMessage(message);
    });
  }

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();
    print('Token: $fCMToken');
    // FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
    await initPushNotifications();
    await initLocalNotifications();
  }
}
