import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:nectar/main.dart';

Future _handelBackgroundMessage(RemoteMessage message) async {
  print("Title: ${message.notification?.title}");
  print("Body: ${message.notification?.body}");
  print("Payload: ${message.data}");
}

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('Token: $fcmToken');

    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true, // Required to display a heads up notification
      badge: true,
      sound: true,
    );

    FirebaseMessaging.onBackgroundMessage(_handelBackgroundMessage);

    void handleMessage(RemoteMessage? message) {
      if (message == null) return;
      navigatorKey.currentState?.pushNamed('/navigation', arguments: message);
    }

    Future initPushNotification() async {
      FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

      FirebaseMessaging.onMessageOpenedApp.listen((event) {
        handleMessage;
      });
    }
  }
}
