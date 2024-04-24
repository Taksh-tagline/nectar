import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class NotificationScreen3 extends StatefulWidget {
  const NotificationScreen3({super.key});

  @override
  State<NotificationScreen3> createState() => _NotificationScreen3State();
}

class _NotificationScreen3State extends State<NotificationScreen3> {
  final TextEditingController _userName = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _body = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted Provisional permission');
    } else {
      print('User decline or hase not give the permission');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notify'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _userName,
          ),
          TextFormField(
            controller: _title,
          ),
          TextFormField(
            controller: _body,
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
              onPressed: () {
                String name = _userName.text.trim();
                String titleText = _title.text;
                String bodyText = _body.text;
              },
              child: const Text('Press'))
        ],
      ),
    );
  }
}
