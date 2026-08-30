import 'package:get/get.dart';
import 'package:mini_pos_system/config/routes/app_routes.dart';
import 'package:mini_pos_system/screen/responsive.dart';
import 'package:mini_pos_system/screen/small/auth/loginscreen.dart';
import 'package:mini_pos_system/screen/small/auth/signupscreen.dart';
import 'package:mini_pos_system/screen/small/homescreen.dart';
import 'package:mini_pos_system/screen/small/productscreen.dart';
import 'package:mini_pos_system/screen/small/salesscreen.dart';
import 'package:mini_pos_system/screen/small/mainpage.dart';
import 'package:mini_pos_system/screen/small/welcomescreen.dart';
import 'package:mini_pos_system/screen/small/product_detailscreen.dart';


class AppRouting {
  String shopname = "";
  static final route = RouteView.values.map((e) {
    switch (e) {
      case RouteView.signupscreen:
        {
          return GetPage(name: "/${e.name}", page: () => Signupscreen());
        }
      case RouteView.loginScreen:
        {
          return GetPage(name: "/${e.name}", page: () => LoginScreen());
        }
      case RouteView.productDetailscreen:
        {
          return GetPage(name: "/${e.name}", page: () => ProductDetailscreen());
        }
      case RouteView.welcome:
        {
          return GetPage(name: "/${e.name}", page: () => Welcomescreen());
        }
      case RouteView.responsive:
        return GetPage(name: "/${e.name}", page: () => Responsive());
      case RouteView.homescreenWidget:
        return GetPage(
          name: "/",
          page: () => HomescreenWidget(shopName: "hello"),
          transition: Transition.noTransition,
        );
      case RouteView.productscreen:
        return GetPage(name: "/${e.name}", page: () => Productscreen());
      case RouteView.salesscreen:
        return GetPage(name: "/${e.name}", page: () => Salesscreen());
      case RouteView.fullScreen:
        return GetPage(
          name: "/${e.name}",
          page: () => MainPage(shopName: "hello"),
        );
    }
  }).toList();
}
