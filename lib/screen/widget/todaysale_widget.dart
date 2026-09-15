import 'package:flutter/material.dart';
import 'package:mini_pos_system/screen/responsive.dart';

class TodaysaleWidget extends StatelessWidget {
  const TodaysaleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width:double.infinity,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: const Color.fromARGB(255, 1, 0, 0).withValues(alpha: 0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Today's Sales",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
        
                const SizedBox(height: 20),
        
                const Text(
                  "\$0.00",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
        
                const SizedBox(height: 8),
        
                const Text("0 transactions", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
