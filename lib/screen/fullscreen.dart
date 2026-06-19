import 'package:flutter/material.dart';
import 'package:mini_pos_system/screen/productscreen.dart';
import 'package:mini_pos_system/screen/salesscreen.dart';
import 'package:mini_pos_system/widget/bottomnavbar_widget.dart';
import 'homescreen.dart';

class Homescreen extends StatefulWidget {
  String shopName = "";

  Homescreen({super.key, required this.shopName});
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int index = 0;
  void onTap() {}
  @override
  Widget build(BuildContext context) {
    List pages = [
      HomescreenWidget(shopName: widget.shopName),
      Salesscreen(),
      Productscreen(),
    ];
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 253, 252, 252),
      body: pages[index],
      bottomNavigationBar: BottomnavbarWidget(
        currentI: index,
        onTap: (i) => setState(() {
          index = i;
        }),
      ),
    );
  }
}
