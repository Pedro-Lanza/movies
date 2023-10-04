import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:movies/app/app_pages.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.fade,
      initialRoute: Routes.home,
      getPages: Pages.pages,
    );
  }
}
