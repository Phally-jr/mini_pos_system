import 'package:flutter/widgets.dart';
import 'package:mini_pos_system/config/routes/app_route.dart';
import 'package:get/get.dart ';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthscreenController extends GetxController {
  var isLoading = false.obs;
  final username = ''.obs;
  final password = ''.obs;
  final SharedPreferences prefs = Get.find<SharedPreferences>();
  final _supabase = Supabase.instance.client;
  Future<void> login(String email, String password) async {
  try {
    isLoading.value = true;

    final response = await _supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );

    if (response.user != null) {
      prefs.setString('username', response.user!.id);

      Get.snackbar(
        "Success",
        "Login successful",
      );

      Get.offAndToNamed(AppRoute.mainpage);
    }
  } catch (e) {
    debugPrint('Error occurred during login: $e');

    Get.snackbar(
      'Error',
      'An error occurred during login.',
      snackPosition: SnackPosition.BOTTOM,
    );
  } finally {
    isLoading.value = false;
  }
}

  void signup(String email, String password) async {
    try {
      isLoading.value = false;
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      Get.snackbar("success", "Login again with your new account");
      if (response.user != null) {
        isLoading.value = false;
        Get.offAndToNamed(AppRoute.loginScreen);
        Get.snackbar("success", "Signup successful");
        Get.snackbar("success", "Login again with your new account");
      } else {
        Get.snackbar(
          'Error',
          'Failed to sign up. Please try again.',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      isLoading.value = false;
      debugPrint('Error occurred during signup: $e');
      Get.snackbar(
        'Error',
        'An error occurred during signup.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
    return;
  }

  void logout() async {
    isLoading.value = true;
    try {
      await _supabase.auth.signOut();
      await prefs.remove('username');
      isLoading.value = false;
      Get.toNamed(AppRoute.loginScreen);
      Get.snackbar(
        'Logout',
        'You have been logged out successfully.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      debugPrint('Error occurred while logging out: $e');
      Get.snackbar(
        'Error',
        'Failed to log out.',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
