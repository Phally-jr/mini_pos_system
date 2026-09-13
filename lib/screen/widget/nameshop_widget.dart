import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/state_manager.dart';
import 'package:mini_pos_system/controller/home_controller.dart';
import 'package:mini_pos_system/screen/responsive.dart';
import 'package:mini_pos_system/controller/auth_controller.dart';

class NameshopWidget extends GetView<HomeController> {
  final String? shopName;
  NameshopWidget({super.key, this.shopName}) {
    Get.put(HomeController());
  }
  final authController = Get.put(AuthscreenController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        height: Responsive.h(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 14.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(
                    () => Text(
                      "Hello, ${shopName ?? controller.name} ",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 52, 47, 47),
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  Text(
                    "Welcome back!",
                    style: TextStyle(
                      color: const Color.fromARGB(255, 73, 69, 69),
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: authController.logout,
              icon: Icon(Icons.logout),
            ),
          ],
        ),
      ),
    );
  }
}
