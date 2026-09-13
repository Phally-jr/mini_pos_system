import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  final prefs = Get.find<SharedPreferences>();

  var name = "".obs;

  @override
  void onInit() {
    super.onInit();
    getName();
  }

  void getName() {
    name.value = prefs.getString("name") ?? "";
  }

  void saveName(String newName) {
    prefs.setString("name", newName);

    name.value = newName; // refresh UI

    Get.back();

    Get.snackbar(
      "Success",
      "Name is changed",
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}