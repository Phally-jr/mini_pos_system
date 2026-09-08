import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/controller/dashboard_controller.dart';
class Dashboard extends GetView<DashbordController> {
   Dashboard({super.key});
  final  controller = Get.put(DashbordController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Welcome to the Dashboard!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}