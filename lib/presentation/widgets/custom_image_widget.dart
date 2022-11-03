import 'package:flutter/material.dart';

class CustomCircleImageWidget extends StatelessWidget {
  const CustomCircleImageWidget({Key? key, required this.img, required this.r})
      : super(key: key);

  final double r;
  final String img;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: r,
      backgroundImage: NetworkImage(img),
    );
  }
}
