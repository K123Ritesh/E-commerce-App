import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sling_ecommerce/routes.dart';
import 'package:sling_ecommerce/screens/splash/splash_screen.dart';
import 'package:sling_ecommerce/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
    );
  }
}
