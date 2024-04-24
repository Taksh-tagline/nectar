import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:nectar/features/models/hive/explore_hive_model.dart';
import 'package:nectar/features/notification/notification_screen3.dart';
import 'package:overlay_support/overlay_support.dart';

import 'features/const/string.dart';
import 'features/models/hive/banner_hive_model.dart';
import 'features/models/hive/card_hive_model.dart';
import 'features/models/hive/groceries_hive_model.dart';
import 'features/models/hive/non_veg_hive_model.dart';
import 'features/models/hive/sell_hive_model.dart';
import 'firebase_options.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseMessaging.instance.getInitialMessage();
  // await FirebaseApi().initNotifications();

  await Hive.initFlutter();
  Hive.registerAdapter<CardHiveModel>(CardHiveModelAdapter());
  Hive.registerAdapter<NutritionHiveModel>(NutritionHiveModelAdapter());
  Hive.registerAdapter<BannerHiveModel>(BannerHiveModelAdapter());
  Hive.registerAdapter<GroceriesHiveModel>(GroceriesHiveModelAdapter());
  Hive.registerAdapter<SellHiveModel>(SellHiveModelAdapter());
  Hive.registerAdapter<SellNutritionHiveModel>(SellNutritionHiveModelAdapter());
  Hive.registerAdapter<NonVegHiveModel>(NonVegHiveModelAdapter());
  Hive.registerAdapter<NonVegNutritionHiveModel>(
      NonVegNutritionHiveModelAdapter());
  Hive.registerAdapter<ExploreHiveModel>(ExploreHiveModelAdapter());
  Hive.registerAdapter<CardExploreModel>(CardExploreModelAdapter());

  await Hive.openBox(StringConst.location);
  await Hive.openBox(StringConst.offerHive);
  await Hive.openBox(StringConst.sellHive);
  await Hive.openBox(StringConst.nonVegHive);
  await Hive.openBox(StringConst.bannerHive);
  await Hive.openBox(StringConst.groceriesHive);
  await Hive.openBox(StringConst.favouriteHive);
  await Hive.openBox('userData');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        theme: ThemeData(fontFamily: 'Gilroy'),
        debugShowCheckedModeBanner: false,
        home: const NotificationScreen3(),
        // navigatorKey: navigatorKey,
      ),
    );
  }
}
