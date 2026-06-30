import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/controller/home_controller.dart';
import 'package:mini_pos_system/screen/widget/nameshop_widget.dart';
import 'package:mini_pos_system/screen/widget/recentsale_widget.dart';
import 'package:mini_pos_system/screen/widget/todaysale_widget.dart';
import 'package:mini_pos_system/screen/widget/bottomnavbar_widget.dart';
import 'package:mini_pos_system/screen/small/productscreen.dart';
import 'package:mini_pos_system/screen/small/salesscreen.dart';
import '../widget/card_widget.dart';

class HomescreenWidget extends StatefulWidget {
  String shopName = "";

  HomescreenWidget({super.key, required this.shopName});
  @override
  State<HomescreenWidget> createState() => _HomescreenWidgetState();
}

class _HomescreenWidgetState extends State<HomescreenWidget> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: Obx(() {
        return _buildBody(controller.selectedTabIndex.value);
      }),
      bottomNavigationBar: Obx(
        () => BottomnavbarWidget(
          currentI: controller.selectedTabIndex.value,
          onTap: (value) {
            controller.selectTab(value);
          },
        ),
      ),
    );
  }

  Widget _buildBody(int index) {
    switch (index) {
      case 0:
        // Home Screen
        return Column(
          children: [
            SizedBox(height: 80),
            NameshopWidget(shopName: widget.shopName),
            SizedBox(height: 15),
            TodaysaleWidget(),
            SizedBox(height: 15),
            RecentsaleWidget(),
            Expanded(child: CardWidget()),
          ],
        );
      case 1:
        // Product Screen
        return Productscreen();
      case 2:
        // Sales Screen
        return Salesscreen();
      default:
        return Column(
          children: [
            SizedBox(height: 80),
            NameshopWidget(shopName: widget.shopName),
            SizedBox(height: 15),
            TodaysaleWidget(),
            SizedBox(height: 15),
            RecentsaleWidget(),
            Expanded(child: CardWidget()),
          ],
        );
    }
  }
}
