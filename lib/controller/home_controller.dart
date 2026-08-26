import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observable state
  final title = 'Mini POPS'.obs;
  final totalSales = 0.obs;
  final isLoading = false.obs;
  final products = <String>[].obs;
  final selectedTabIndex = 0.obs;

  late final String apiUrl;

  

  void incrementSales(int amount) => totalSales.value += amount;
  void selectTab(int value) {
    selectedTabIndex.value = value;
  }


  void addProduct(String name) {
    products.add(name);
  }

  void clearProducts() => products.clear();
}
