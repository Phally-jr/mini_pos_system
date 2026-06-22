import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/screen/small/fullscreen.dart';
import '../screen/responsive.dart';
import '../screen/medium/homescreenmedium.dart';
import '../screen/large/homescreenlarge.dart';

class HomeController extends GetxController {
  Widget buildResponsive() => Responsive(
    small:Homescreen(shopName:"phally",),
    medium: Homescreenmedium(),
    large: Homescreenlarge(),
  );

  @override
  void onInit() {
    super.onInit;
    buildResponsive();
  }
}
