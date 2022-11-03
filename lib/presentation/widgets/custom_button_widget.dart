import 'package:flutter/material.dart';
import 'package:gellary/config/color.dart';
import 'package:gellary/config/text_them.dart';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/presentation/widgets/custom_text_widget.dart';

class CustomButtonWidget extends StatelessWidget {
 const CustomButtonWidget({Key? key, required this.txt, required this.onPress}) : super(key: key);
  final String txt;

  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed:()=> onPress(),
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(const Size.fromHeight( 50)),
        backgroundColor:
        MaterialStateProperty.all(lightBlue),
      ),
      child: CustomTextWidget(
        txt: txt.toUpperCase(),
        style:width! >= 600?textThemeData.headlineMedium!.copyWith(color: white): textThemeData.titleSmall!
            .copyWith(color: white),
      ),
    );
  }
}
