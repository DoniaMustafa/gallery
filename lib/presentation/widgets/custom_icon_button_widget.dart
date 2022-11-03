import 'package:flutter/material.dart';
import 'package:gellary/config/color.dart';
import 'package:gellary/config/text_them.dart';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/presentation/widgets/custom_text_widget.dart';

class CustomIconButtonWidget extends StatelessWidget {
  const CustomIconButtonWidget(
      {Key? key,
      required this.label,
      required this.icon,
      required this.onTap,
      required this.color,
      required this.bodyColor})
      : super(key: key);
  final String label;
  final IconData icon;
  final GestureTapCallback onTap;
  final Color color;
  final Color bodyColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height:   width! >= 600?50 : 35,
        padding:  EdgeInsets.symmetric(horizontal: width! >= 600?30.0:15.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
              color: white
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(3.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: color,
                      spreadRadius:2,
                      blurRadius: 4,
                      offset: Offset(0, 1),
                    ),
                  ],
                  color: bodyColor),
              child: Icon(icon,opticalSize: 20,
                color: white,
                size:width! >= 600?25: 15,
              ),
            ),
          const  SizedBox(width: 15,),
            CustomTextWidget(txt: label,style:width! >= 600?textThemeData.titleLarge: textThemeData.bodyLarge,)
          ],
        ),
      ),
    );
  }
}
