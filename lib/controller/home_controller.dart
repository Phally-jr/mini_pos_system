import 'package:get/get.dart';
import '../model/product_model.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mini_pos_system/service/api_service.dart';

class HomeController extends GetxController {
  // Observable state
  final title = 'Mini POS'.obs;
  final totalSales = 0.obs;
  final isLoading = false.obs;
  final products = <String>[].obs;
  final selectedTabIndex = 0.obs;

  late final String apiUrl;
  @override
  void onInit() {
    super.onInit();
    
  }

  

  void incrementSales(int amount) => totalSales.value += amount;
  void selectTab(int value) {
    selectedTabIndex.value = value;
  }


  void addProduct(String name) {
    products.add(name);
  }

  void clearProducts() => products.clear();
}
