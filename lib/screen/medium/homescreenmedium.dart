import 'package:flutter/material.dart';

class Homescreenmedium extends StatelessWidget {
  const Homescreenmedium({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 0, 0)),
      child: Center(
        child: Text(
          "This app is not supported for  laptop or tablet screen. Please use a mobile device to access the app.",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
      ),
    );
  }
}
