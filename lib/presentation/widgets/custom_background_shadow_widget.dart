import 'package:flutter/material.dart';
import 'package:gellary/config/color.dart';
import 'package:gellary/core/utils/constant.dart';

class CustomBackgroundShadowWidget extends StatelessWidget {
  const CustomBackgroundShadowWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 70,
          left: 0,
          child: Container(
            width:width! >= 600?300: 150,
            height: width! >= 600?500:400,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width! >= 600?100:50),
                    topRight: Radius.circular(width! >= 600?100:30),
                    bottomLeft: Radius.circular(width! >= 600?100:30)),
                boxShadow: [
                  BoxShadow(
                      color: lightPurple,
                      blurRadius: 50,
                      spreadRadius: 3,
                      offset: Offset(0, 1)),
                ]),
          ),
        ),
        Positioned(
          bottom: 80,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height:width! >= 600?500: 260,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(width! >= 600?100:50),
                    bottomLeft: Radius.circular(width! >= 600?100:50)),
                boxShadow: [
                  BoxShadow(
                      color: lightCoral,
                      blurRadius: 50,
                      spreadRadius: 3,
                      offset: Offset(0, 1)),
                ],),
          ),
        ),
        Positioned(
          top: 5,
          right: 0,
          child: Container(
            alignment: Alignment.topCenter,
            width: width! >= 600?600:320,
            height:width! >= 600? 680:520,
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(width! >= 600?100:50),
                    topRight: Radius.circular(width! >= 600?100:30),
                    bottomLeft: Radius.circular(width! >= 600?100:50)),
                boxShadow: [
                  BoxShadow(
                      color: lightGray,
                      blurRadius: 50,
                      spreadRadius: 3,
                      offset: Offset(0, 1)),
                ]),
          ),
        ),

      ],
    );
  }
}
