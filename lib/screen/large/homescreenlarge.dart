import 'package:flutter/material.dart';

class Homescreenlarge extends StatelessWidget {
  const Homescreenlarge({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.amberAccent),
      child: Center(
        child: Text(
          "This app is not supported for  laptop or tablet screen. Please use a mobile device to access the app.",
          style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 30),
        ),
      )
    );
  }
}
