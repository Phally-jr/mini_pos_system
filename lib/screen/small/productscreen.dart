import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/config/routes/app_route.dart';
import 'package:mini_pos_system/controller/product_controller.dart';
import 'package:mini_pos_system/model/product_model.dart';
import 'package:mini_pos_system/screen/small/addproductscreen.dart';
import 'package:mini_pos_system/screen/small/editproductscreen.dart';
import '../widget/searchbar_widget.dart';

class Productscreen extends StatelessWidget {
  final controller = Get.put(ProductController());

  Productscreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Management"),
        actions: [
          InkWell(
            child: Icon(Icons.add, size: 30),
            onTap: () => {
              Get.toNamed(AppRoute.addProduct), //dak screen
            },
          ),
        ],
        backgroundColor: Colors.indigo,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchbarWidget(),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(child: CircularProgressIndicator());
                }

                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (_, index) {
                    final p = controller.products[index];

                    return Card(
                      child: ListTile(
                        title: Text(p.pName),
                        subtitle: Text("Stock: ${p.pQty}"),

                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text("\$${p.pPrice}"),

                            const SizedBox(width: 10),

                            // Edit
                            IconButton(
                              onPressed: () {
                                Get.to(() => EditProductScreen(product: p));
                              },
                              icon: const Icon(Icons.edit),
                            ),

                            // Delete
                            IconButton(
                              onPressed: () {
                                  Get.dialog(
                                    AlertDialog(
                                      title: const Text('Delete Product',),
                                      content: const Text(
                                        'Are you sure to delete this product?',
                                      ),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Get.back(); // Cancel
                                          },
                                          child: const Text('Cancel'),
                                        ),
                                        TextButton(
                                          onPressed: () async {
                                            Get.back(); // Close dialog

                                            await controller.deleteProduct(p.pid);
                                          },
                                          child: const Text('Delete',style: TextStyle(color: Colors.red),),
                                        ),
                                      ],
                                    ),
                                  );
                                      },
                                  icon: const Icon(Icons.delete,color:Colors.red,),
                                ),  
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 10),
            Text("${controller.products.length} product")
          ],
        ),
      ),
    );
  }
}
