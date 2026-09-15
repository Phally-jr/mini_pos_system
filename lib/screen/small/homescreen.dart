import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/config/routes/app_route.dart';
import 'package:mini_pos_system/controller/auth_controller.dart';
import 'package:mini_pos_system/screen/widget/lowstockwidget.dart';
import 'package:mini_pos_system/screen/widget/nameshop_widget.dart';
import 'package:mini_pos_system/screen/widget/recentsale_widget.dart';
import 'package:mini_pos_system/screen/widget/todaysale_widget.dart';
import 'package:mini_pos_system/screen/widget/lowstockwidget.dart';

class HomescreenWidget extends StatelessWidget {
  var controller = Get.put(AuthscreenController());
  HomescreenWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        InkWell(
          child: NameshopWidget(),
          onTap: () => Get.toNamed(AppRoute.changename),
        ),

        TodaysaleWidget(),
        InkWell(child: RecentsaleWidget(),onTap: ()=>Get.toNamed(AppRoute.saleHistory),),
        LowStockWidget()
      ],
    );
  }
}
