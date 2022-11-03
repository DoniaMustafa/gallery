
import 'package:flutter/material.dart';
import 'package:gellary/config/text_them.dart';
import 'package:gellary/presentation/widgets/custom_text_widget.dart';

class CustomButtonWithImgWidget extends StatelessWidget {
  const CustomButtonWithImgWidget(
      {Key? key, required this.img, required this.txt,required this.tap})
      : super(key: key);
  final String img;
  final GestureTapCallback tap;
  final String txt;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        padding: EdgeInsets.all(10),
        width: 160,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
              color: Color(0xFFEBF6FF)
        ),
        child: Row(

          children: [
            Image(
              image: AssetImage(img),
              width: 50,
              height: 75,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              width: 10,
            ),
            CustomTextWidget(txt: txt,
            style: textThemeData.titleLarge,),
          ],
        ),
      ),
    );
  }
}
