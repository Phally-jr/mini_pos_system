import 'package:flutter/material.dart';
import 'package:mini_pos_system/config/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:mini_pos_system/controller/home_controller.dart';
import '../widget/searchbar_widget.dart';

class Productscreen extends GetView<HomeController> {
  const Productscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Management"),
        actions: [
          InkWell(
            child: Icon(Icons.add),
            onTap: () => {
              Container(), //dak screen
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
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) => InkWell(
                  child: Container(
                    width: double.infinity,
                    height: 130,
                    margin: const EdgeInsets.only(top: 10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 246, 247, 247),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 110, 108, 108),
                          blurRadius: 5,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 130,
                          height: 130,
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 255, 255, 255),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                          child: const Icon(Icons.image, size: 50),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  "Product Name",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text("Stock"),
                                SizedBox(height: 5),
                                Text("Price: \$100",style: TextStyle(color: Colors.blue),),
                              ],
                            ),
                          ),
                        ),
                          Column(
                            children: [
                               IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  // Handle edit action
                                },
                                style: ButtonStyle(
                                  foregroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Handle delete action
                                },
                                style: ButtonStyle(
                                  foregroundColor: WidgetStateProperty.all<Color>(const Color.fromARGB(255, 204, 8, 8)),
                                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ),
                              

                            ],
                           
                          ),
                          
                        
                        
                      ],
                    ),
                  ),
                  onTap: () => RouteView.productDetailscreen.go(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("n products"),
          ],
        ),
      ),
    );
  }
}
