import 'package:flutter/material.dart';
import 'package:mini_pos_system/widget/searchbar_widget.dart';
class Salesscreen extends StatefulWidget {
  const Salesscreen({super.key});

  @override
  State<Salesscreen> createState() => _SalesscreenState();
}
class _SalesscreenState extends State<Salesscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 80),
          SearchbarWidget(),
        ],
      )
    );
  }
}