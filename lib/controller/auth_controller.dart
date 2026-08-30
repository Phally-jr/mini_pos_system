import 'package:get/get.dart ';
class AuthscreenController extends GetxController {
  // Observable state
  final isAuthenticated = false.obs;
  final username = ''.obs;
  final password = ''.obs;

  void login(String user, String pass) {
    // Implement login logic here
    if (user == 'admin' && pass == 'password') {
      isAuthenticated.value = true;
      username.value = user;
      password.value = pass;
    } else {
      isAuthenticated.value = false;
    }
  }

  void logout() {
    isAuthenticated.value = false;
    username.value = '';
    password.value = '';
  }
}