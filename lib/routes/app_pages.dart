import 'package:get/get.dart';
import 'package:mini_pos_system/routes/app_routes.dart';
import 'package:mini_pos_system/screen/responsive.dart';
import 'package:mini_pos_system/screen/small/homescreen.dart';
import 'package:mini_pos_system/screen/small/productscreen.dart';
import 'package:mini_pos_system/screen/small/salesscreen.dart';
import 'package:mini_pos_system/screen/small/fullscreen.dart';
import 'package:mini_pos_system/screen/small/welcomescreen.dart';
import 'package:mini_pos_system/screen/small/product_detailscreen.dart';

class AppRouting {
  String shopname = "";
  static final route = RouteView.values.map((e) {
    switch (e) {
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
          page: () => Homescreen(shopName: "hello"),
        );
    }
  }).toList();
}
