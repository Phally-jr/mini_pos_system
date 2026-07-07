import 'package:get/get.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mini_pos_system/service/api_service.dart';
import '../model/product_model.dart';

class ProductController extends GetxController {
  final isLoading = false.obs;
  final products = <Product>[].obs;
  final selectedProduct = Rxn<Product>();

  late final String apiUrl;
  late final ApiService apiService;

  @override
  void onInit() {
    super.onInit();
    _initEnv();
    fetchProducts();
  }

  Future<void> _initEnv() async {
    if (!dotenv.isInitialized) {
      await dotenv.load();
    }
    apiUrl = dotenv.get('URL');
    apiService = ApiService(baseUrl: apiUrl);
  }

  Future<void> fetchProducts() async {
    isLoading.value = true;
    try {
      final result = await apiService.callApi<ProductsModel>(
        endpoint: '/products',
        fromJson: (data) => _productsModelFromJson(data),
      );

      products.assignAll(result.products);
    } finally {
      isLoading.value = false;
    }
  }

  Future<Product> getProductById(int id) async {
    isLoading.value = true;
    try {
      final result = await apiService.callApi<Product>(
        endpoint: '/products/$id',
        fromJson: (data) => _productFromJson(data),
      );
      selectedProduct.value = result;
      return result;
    } finally {
      isLoading.value = false;
    }
  }

  Future<Product> createProduct(Map<String, dynamic> body) async {
    isLoading.value = true;
    try {
      final result = await apiService.callApi<Product>(
        endpoint: '/products',
        method: 'POST',
        body: body,
        fromJson: (data) => _productFromJson(data),
      );
      products.add(result);
      return result;
    } finally {
      isLoading.value = false;
    }
  }

  Future<Product> updateProduct(int id, Map<String, dynamic> body) async {
    isLoading.value = true;
    try {
      final result = await apiService.callApi<Product>(
        endpoint: '/products/$id',
        method: 'PUT',
        body: body,
        fromJson: (data) => _productFromJson(data),
      );
      final idx = products.indexWhere((p) => p.id == id);
      if (idx >= 0) products[idx] = result;
      return result;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteProduct(int id) async {
    isLoading.value = true;
    try {
      await apiService.callApi<void>(
        endpoint: '/products/$id',
        method: 'DELETE',
        fromJson: (_) => throw UnimplementedError(),
      );
      products.removeWhere((p) => p.id == id);
    } finally {
      isLoading.value = false;
    }
  }
}

// --- JSON parsing helpers mapping API responses to the existing models ---

ProductsModel _productsModelFromJson(Map<String, dynamic> json) {
  final items = <Product>[];
  if (json['products'] is List) {
    for (final item in json['products']) {
      if (item is Map<String, dynamic>) items.add(_productFromJson(item));
    }
  }

  return ProductsModel(
    products: items,
    total: json['total'] ?? items.length,
    skip: json['skip'] ?? 0,
    limit: json['limit'] ?? items.length,
  );
}

Product _productFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] ?? 0,
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    category: _categoryFromString(json['category']?.toString() ?? ''),
    price: (json['price'] is num)
        ? (json['price'] as num).toDouble()
        : double.tryParse('${json['price']}') ?? 0.0,
    discountPercentage: (json['discountPercentage'] is num)
        ? (json['discountPercentage'] as num).toDouble()
        : double.tryParse('${json['discountPercentage']}') ?? 0.0,
    rating: (json['rating'] is num)
        ? (json['rating'] as num).toDouble()
        : double.tryParse('${json['rating']}') ?? 0.0,
    stock: json['stock'] ?? 0,
    tags: (json['tags'] is List)
        ? List<String>.from(json['tags'].map((e) => e.toString()))
        : <String>[],
    brand: json['brand']?.toString(),
    sku: json['sku']?.toString() ?? '',
    weight: json['weight'] ?? 0,
    dimensions: _dimensionsFromJson(json['dimensions'] ?? {}),
    warrantyInformation: json['warrantyInformation']?.toString() ?? '',
    shippingInformation: json['shippingInformation']?.toString() ?? '',
    availabilityStatus: _availabilityFromString(
      json['availabilityStatus']?.toString() ?? '',
    ),
    reviews: (json['reviews'] is List)
        ? (json['reviews'] as List)
              .map((e) => _reviewFromJson(Map<String, dynamic>.from(e)))
              .toList()
        : <Review>[],
    returnPolicy: _returnPolicyFromString(
      json['returnPolicy']?.toString() ?? '',
    ),
    minimumOrderQuantity: json['minimumOrderQuantity'] ?? 1,
    meta: _metaFromJson(json['meta'] ?? {}),
    images: (json['images'] is List)
        ? List<String>.from(json['images'].map((e) => e.toString()))
        : <String>[],
    thumbnail: json['thumbnail']?.toString() ?? '',
  );
}

Dimensions _dimensionsFromJson(dynamic json) {
  if (json is Map<String, dynamic>) {
    return Dimensions(
      width: (json['width'] is num)
          ? (json['width'] as num).toDouble()
          : double.tryParse('${json['width']}') ?? 0.0,
      height: (json['height'] is num)
          ? (json['height'] as num).toDouble()
          : double.tryParse('${json['height']}') ?? 0.0,
      depth: (json['depth'] is num)
          ? (json['depth'] as num).toDouble()
          : double.tryParse('${json['depth']}') ?? 0.0,
    );
  }
  return Dimensions(width: 0.0, height: 0.0, depth: 0.0);
}

Meta _metaFromJson(dynamic json) {
  if (json is Map<String, dynamic>) {
    return Meta(
      createdAt: DateTime.tryParse('${json['createdAt']}') ?? DateTime.now(),
      updatedAt: DateTime.tryParse('${json['updatedAt']}') ?? DateTime.now(),
      barcode: json['barcode']?.toString() ?? '',
      qrCode: json['qrCode']?.toString() ?? '',
    );
  }
  return Meta(
    createdAt: DateTime.now(),
    updatedAt: DateTime.now(),
    barcode: '',
    qrCode: '',
  );
}

Review _reviewFromJson(Map<String, dynamic> json) {
  return Review(
    rating: json['rating'] ?? 0,
    comment: json['comment']?.toString() ?? '',
    date: DateTime.tryParse('${json['date']}') ?? DateTime.now(),
    reviewerName: json['reviewerName']?.toString() ?? '',
    reviewerEmail: json['reviewerEmail']?.toString() ?? '',
  );
}

Category _categoryFromString(String value) {
  final v = value.toUpperCase();
  switch (v) {
    case 'BEAUTY':
      return Category.BEAUTY;
    case 'FRAGRANCES':
      return Category.FRAGRANCES;
    case 'FURNITURE':
      return Category.FURNITURE;
    case 'GROCERIES':
      return Category.GROCERIES;
    default:
      return Category.GROCERIES;
  }
}

AvailabilityStatus _availabilityFromString(String value) {
  final v = value.toUpperCase();
  switch (v) {
    case 'IN_STOCK':
    case 'INSTOCK':
      return AvailabilityStatus.IN_STOCK;
    case 'LOW_STOCK':
    case 'LOWSTOCK':
      return AvailabilityStatus.LOW_STOCK;
    default:
      return AvailabilityStatus.IN_STOCK;
  }
}

ReturnPolicy _returnPolicyFromString(String value) {
  final v = value.toUpperCase();
  switch (v) {
    case 'NO_RETURN_POLICY':
      return ReturnPolicy.NO_RETURN_POLICY;
    case 'THE_30_DAYS_RETURN_POLICY':
      return ReturnPolicy.THE_30_DAYS_RETURN_POLICY;
    case 'THE_60_DAYS_RETURN_POLICY':
      return ReturnPolicy.THE_60_DAYS_RETURN_POLICY;
    case 'THE_7_DAYS_RETURN_POLICY':
      return ReturnPolicy.THE_7_DAYS_RETURN_POLICY;
    case 'THE_90_DAYS_RETURN_POLICY':
      return ReturnPolicy.THE_90_DAYS_RETURN_POLICY;
    default:
      return ReturnPolicy.NO_RETURN_POLICY;
  }
}
