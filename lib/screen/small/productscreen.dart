import 'package:flutter/material.dart';
import 'package:mini_pos_system/routes/app_routes.dart';

import '../widget/searchbar_widget.dart';

class Productscreen extends StatefulWidget {
  const Productscreen({super.key});

  @override
  State<Productscreen> createState() => _ProductscreenState();
}

class _ProductscreenState extends State<Productscreen> {
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
                      color: Color.fromARGB(255, 39, 120, 160),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
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
