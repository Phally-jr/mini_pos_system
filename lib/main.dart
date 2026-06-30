import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/binding/homebinding.dart';
import 'package:mini_pos_system/routes/app_pages.dart';
import 'package:mini_pos_system/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: Homebinding(),
      title: 'Flutter Demo',
      //home: HomeController().buildResponsive(),
      initialRoute: RouteView.responsive.name,
      getPages: AppRouting.route,
    );
  }
}
