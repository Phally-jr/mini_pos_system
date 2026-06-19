import 'package:flutter/material.dart';

class NameshopWidget extends StatelessWidget {
  final String? shopName;
  const NameshopWidget({super.key, this.shopName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: const Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 14.0, top: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Hello, ${shopName ?? 'Shop'} ",
                style: TextStyle(
                  color: const Color.fromARGB(255, 52, 47, 47),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "Welcome back!",
                style: TextStyle(
                  color: const Color.fromARGB(255, 73, 69, 69),
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
