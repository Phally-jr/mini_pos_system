import 'package:get/get.dart';
import 'package:mini_pos_system/controller/home_controller.dart';

class Homebinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
  }
}
