import 'package:get/get.dart';
import 'package:mini_pos_system/screen/responsive.dart';
import 'package:mini_pos_system/screen/small/auth/loginscreen.dart';
import 'package:mini_pos_system/screen/small/auth/signupscreen.dart';
import 'package:mini_pos_system/screen/small/dashboard.dart';
import 'package:mini_pos_system/screen/small/mainpage.dart';
import 'package:mini_pos_system/screen/small/homescreen.dart';

//use AppRoute.name.routeName   to navigate to the route
class AppRoute {
  static const init = '/';
  static const dashboard = '/dashboard';
  static const signup = '/signup';
  static const loginScreen = '/login';
  static const homescreen = '/homescreen';
  static const mainpage = '/mainpage';
  static const productScreen = '/productScreen';
  static const productDetailScreen = '/ProductDetailscreen';
  static const saleScreen='/saleScreen';

  static final route = [
    GetPage(name: init, page: () => Responsive()),
    GetPage(name: dashboard, page: () => Dashboard()),
    GetPage(name: loginScreen, page: () => LoginScreen()),
    GetPage(name: signup, page: () => Signupscreen()),
    GetPage(name: homescreen, page: () => HomescreenWidget()),
    GetPage(name: mainpage,page: () => MainPage(),
    ),
  ];
}
