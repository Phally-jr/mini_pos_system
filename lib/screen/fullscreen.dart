import 'package:flutter/material.dart';
import 'package:mini_pos_system/screen/productscreen.dart';
import 'package:mini_pos_system/screen/salesscreen.dart';

import 'homescreen.dart';

class Homescreen extends StatefulWidget {
  String shopName = "";
  Homescreen({super.key,required this.shopName});
  @override
  State<Homescreen> createState() => _HomescreenState();
}
class _HomescreenState extends State<Homescreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
  List pages = 
  [
    HomescreenWidget(shopName: widget.shopName),
    Salesscreen(),
    Productscreen(),
  ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 252, 252),
      body: pages[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: "Sales",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits),
            label: "Products",
          ),
        ],
      ),
    );
  }
}
