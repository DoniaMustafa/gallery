import 'package:flutter/material.dart';
import 'package:gellary/config/color.dart';
import 'package:gellary/presentation/widgets/Custom_chip_widget.dart';
import 'package:gellary/presentation/widgets/custom_background_graphic_widget.dart';
import 'package:gellary/presentation/widgets/custom_background_shadow_widget.dart';
import 'package:gellary/presentation/widgets/custom_circle_widget.dart';
import 'package:gellary/presentation/widgets/custom_image_widget.dart';

import '../../../../core/utils/constant.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [const CustomBackgroundShadowWidget(), buildMiddleWidget()],
    );
  }

  Widget buildMiddleWidget() {
    return Stack(
      fit: StackFit.expand,
      children: [
        buildChipBack(),
        Column(
          children:  [
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.only(top: width!>=600?30:15.0, right: width!>=600?40: 20),
                  child: CustomCircleImageWidget(
                    r:  width!>=600?50:35,
                    img:
                        'https://ps.w.org/user-avatar-reloaded/assets/icon-256x256.png?rev=2540745',
                  ),
                )),
            SizedBox(
              height: 240,
            ),
             CustomBackgroundGraphicWidget(),
          ],
        ),
      ],
    );
  }

  Widget buildChipBack() => CustomChipWidget();
}
