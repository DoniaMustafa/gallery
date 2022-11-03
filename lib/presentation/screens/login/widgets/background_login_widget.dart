import 'package:flutter/material.dart';
import 'package:gellary/config/color.dart';
import 'package:gellary/config/text_them.dart';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/presentation/widgets/Custom_chip_widget.dart';
import 'package:gellary/presentation/widgets/custom_background_graphic_widget.dart';
import 'package:gellary/presentation/widgets/custom_background_shadow_widget.dart';
import 'package:gellary/presentation/widgets/custom_text_widget.dart';

class BackgroundLoginWidget extends StatelessWidget {
  const BackgroundLoginWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
          CustomBackgroundShadowWidget(),
        buildBackgroundGraphic()
      ],
    );
  }


  Widget buildBackgroundGraphic()=>Stack(
    children: [
      CustomChipWidget(),
      buildGraphicWidget()
    ],
  );

  Widget buildGraphicWidget()=>Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
       Padding(
        padding:  EdgeInsets.only(left: 60.0,top:width! >= 600?100: 80),
        child: Image(image: AssetImage('assets/love.png'),
        height:width! >= 600?150: 100,
        width: width! >= 600?130:90,),
      ),
      const SizedBox(height: 20,),
      Align(
        alignment: Alignment.center,
          child: CustomTextWidget(txt: 'My\nGallery',style: textThemeData.displayMedium)),
      const SizedBox(height: 70,),
      const Padding(
        padding:  EdgeInsets.symmetric(horizontal: 40.0),
        child: CustomBackgroundGraphicWidget(),
      )


    ],
  );
}
