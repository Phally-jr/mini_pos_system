import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/controller/home_controller.dart';
import 'package:mini_pos_system/screen/widget/nameshop_widget.dart';
import 'package:mini_pos_system/screen/widget/recentsale_widget.dart';
import 'package:mini_pos_system/screen/widget/todaysale_widget.dart';
import '../widget/card_widget.dart';

class HomescreenWidget extends StatelessWidget {
  String shopName = "";
  var controller = Get.put(HomeController());
  HomescreenWidget({super.key, required this.shopName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 244, 244, 244),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {return Column(
          children: [
            SizedBox(height: 80),
            NameshopWidget(shopName: shopName),
            SizedBox(height: 15),
            TodaysaleWidget(),
            SizedBox(height: 15),
            RecentsaleWidget(),
            Expanded(child: CardWidget()),
          ],
      
          
        );
    }
  }

