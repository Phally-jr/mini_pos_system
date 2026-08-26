import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mini_pos_system/config/service/api_service.dart';

class ProductController extends GetxController {
  final products = <String>[].obs;
  final isLoading = false.obs;
  late final String apiUrl;
  //late final ApiService apiService;
  @override
  void onInit() {
    super.onInit();
    oninitEnv();
  }
  void oninitEnv() {
    apiUrl = dotenv.get('URL');
    void addProduct(String product) {
      products.add(product);
    }
    void clearProducts() => products.clear();
  }
}
