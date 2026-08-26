import 'package:get/get.dart';

class ProductController extends GetxController {
  final products = <String>[].obs;
  final isLoading = false.obs;
  late final String apiUrl;
  //late final ApiService apiService;

}
