import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailscreen extends StatefulWidget {
  const ProductDetailscreen({super.key});
  @override
  State<StatefulWidget> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetailscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
        backgroundColor: Colors.indigo,
        leading: InkWell(
          child: Icon(Icons.arrow_back),
          onTap: () => Get.back(),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
          ),
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.black),
          ),
        ],
      ),
    );
  }
}
