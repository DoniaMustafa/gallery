import 'package:flutter/material.dart';

class CustomCircleWidget extends StatelessWidget {
  const CustomCircleWidget({Key? key, this.img,required this.r, required this.color}) : super(key: key);
  final double r;
  final Color color;
  final String? img;
  @override
  Widget build(BuildContext context) {
    return  CircleAvatar(
      radius: r,
      backgroundColor: color,

    );
  }
}
