import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/binding/homebinding.dart';
import 'package:mini_pos_system/controller/home_controller.dart';

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
      home: HomeController().buildResponsive(),
    );
  }
}
