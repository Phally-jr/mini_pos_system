import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/routes/app_pages.dart';
import 'package:mini_pos_system/routes/app_routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      //home: HomeController().buildResponsive(),
      initialRoute: RouteView.responsive.name,
      getPages: AppRouting.route,
    );
  }
}
