import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:numattendance/helper/di.dart';
import 'package:numattendance/helper/firebase_options.dart';
import 'package:numattendance/helper/router_helper.dart';
import 'package:numattendance/utils/app_constants.dart';

import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  if (Platform.isAndroid) {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  } else {
    await Firebase.initializeApp();
  }

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConstants.appName,
      navigatorKey: Get.key,
      getPages: RouterHelper.routes,
    );
  }
}
