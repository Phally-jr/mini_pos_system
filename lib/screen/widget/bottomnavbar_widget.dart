import 'package:flutter/material.dart';

class BottomnavbarWidget extends StatefulWidget {
  // ignore: strict_top_level_inference, prefer_typing_uninitialized_variables
  final currentI;
  final Function(int) onTap;
  const BottomnavbarWidget({super.key, required this.currentI, required this.onTap});
  @override
  State<StatefulWidget> createState() {
    return _BottomnavbarWidgetState();
  }
}

class _BottomnavbarWidgetState extends State<BottomnavbarWidget> {
  List<IconData> logo = [
    Icons.home,
    Icons.production_quantity_limits,
    Icons.sell,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Stack(
        children: [
          Container(
            height: 80,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.indigo,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
          ),
          Column(
            children: [
              SizedBox(height: 20),
              Row(
                children: List.generate(
                  logo.length,
                  (index) => Padding(
                    padding: EdgeInsetsGeometry.only(left: 80),
                    child: InkWell(
                      child: Icon(
                        logo[index],
                        size: 35,
                        color: (index == widget.currentI ? Colors.black : Colors.grey),
                      ),
                      onTap: () => setState(() {
                        widget.onTap(index);
                      }),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
