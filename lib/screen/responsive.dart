import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/controller/home_controller.dart';


class Responsive extends GetResponsiveView<HomeController> {
  Widget? small, medium, large;
   Responsive({super.key, this.small, this.medium, this.large});
  @override
  Widget? phone() {
    return small;
  }

  @override
  Widget? tablet() {
    return medium;
  }

  @override
  Widget? desktop() {
    return large;
  }
}
