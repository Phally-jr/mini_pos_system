import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/controller/home_controller.dart';
import 'package:mini_pos_system/screen/large/homescreenlarge.dart';
import 'package:mini_pos_system/screen/medium/homescreenmedium.dart';
import 'package:mini_pos_system/screen/small/homescreen.dart';

class Responsive extends GetResponsiveView<HomeController> {
  Widget? small, medium, large;
  Responsive({super.key, this.small, this.medium, this.large});
  @override
  Widget? phone() {
    return small ?? HomescreenWidget(shopName: "POS System");
  }

  @override
  Widget? tablet() {
    return medium ?? Homescreenmedium();
  }

  @override
  Widget? desktop() {
    return large ?? Homescreenlarge();
  }
}
