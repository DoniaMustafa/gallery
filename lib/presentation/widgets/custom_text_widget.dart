import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  CustomTextWidget({Key? key, required this.txt,  this.style,this.line=2})
      : super(key: key);
  final String txt;
  final TextStyle? style;
  final int line ;
  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: style,
      maxLines: line,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
      // textAlign: TextAlign.center,
    );
  }
}
