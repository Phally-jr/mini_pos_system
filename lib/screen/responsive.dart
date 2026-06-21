import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Responsive extends GetResponsiveView {
  Widget? small, medium, large;
   Responsive({super.key,required this.small,required this.medium,required this.large});
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
