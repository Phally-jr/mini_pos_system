import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../model/product_model.dart';

class ProductDetailscreen extends StatefulWidget {
  const ProductDetailscreen({super.key});
  @override
  State<StatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailscreen> {
  Product get product => Get.arguments as Product? ?? _dummyProduct;

  static final Product _dummyProduct = Product(
    id: 1,
    title: "Premium Wireless Headphones",
    description: "Experience high-quality sound with our premium wireless headphones. Features include noise cancellation, 30-hour battery life, and a comfortable over-ear design perfect for long listening sessions.",
    category: Category.FURNITURE,
    price: 299.99,
    discountPercentage: 15.0,
    rating: 4.8,
    stock: 42,
    tags: ["electronics", "audio"],
    brand: "SoundMaster",
    sku: "SM-WH-001",
    weight: 250,
    dimensions: Dimensions(width: 15.0, height: 20.0, depth: 8.0),
    warrantyInformation: "2 years limited warranty",
    shippingInformation: "Ships in 24 hours",
    availabilityStatus: AvailabilityStatus.IN_STOCK,
    reviews: [],
    returnPolicy: ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
    minimumOrderQuantity: 1,
    meta: Meta(createdAt: DateTime.now(), updatedAt: DateTime.now(), barcode: "123456789", qrCode: "qr"),
    images: ["https://picsum.photos/400/300"],
    thumbnail: "https://picsum.photos/150/150",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F8),
      appBar: AppBar(
        title: const Text(
          "Product Details",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.indigo,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.white),
            onPressed: () {
              // Handle edit action
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.white),
            onPressed: () {
              // Handle delete action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Container(
              width: double.infinity,
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  image: NetworkImage(product.images.isNotEmpty ? product.images[0] : product.thumbnail),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            
            // Content
            Container(
              transform: Matrix4.translationValues(0, -25, 0),
              decoration: const BoxDecoration(
                color: Color(0xFFF4F6F8),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            product.title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "\$${product.price.toStringAsFixed(2)}",
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.indigo,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: product.stock > 0 ? Colors.green.withAlpha(1) : Colors.red.withAlpha(1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            product.stock > 0 ? "In Stock (${product.stock})" : "Out of Stock",
                            style: TextStyle(
                              color: product.stock > 0 ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            const Icon(Icons.star, color: Colors.amber, size: 22),
                            const SizedBox(width: 5),
                            Text(
                              product.rating.toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            ),
                          ],
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 30),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black54,
                        height: 1.6,
                      ),
                    ),
                    
                    const SizedBox(height: 30),
                    const Text(
                      "Details",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      padding: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withAlpha(1),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow("Brand", product.brand ?? "N/A"),
                          const Divider(),
                          _buildDetailRow("SKU", product.sku),
                          const Divider(),
                          _buildDetailRow("Weight", "${product.weight}g"),
                          const Divider(),
                          _buildDetailRow("Warranty", product.warrantyInformation),
                          const Divider(),
                          _buildDetailRow("Shipping", product.shippingInformation),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              label,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
