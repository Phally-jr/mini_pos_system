import 'package:get/get.dart';

class HomeController extends GetxController {
  // Observable state
  final title = 'Mini POS'.obs;
  final totalSales = 0.obs;
  final isLoading = false.obs;
  final products = <String>[].obs;
  final selectedTabIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void incrementSales(int amount) => totalSales.value += amount;

  void selectTab(int value) {
    selectedTabIndex.value = value;
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    await Future.delayed(const Duration(milliseconds: 500));
    products.assignAll(['Apple', 'Banana', 'Orange']);
    isLoading.value = false;
  }

  void addProduct(String name) {
    products.add(name);
  }

  void clearProducts() => products.clear();
}
