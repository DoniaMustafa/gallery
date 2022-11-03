import 'package:flutter/material.dart';
import 'package:gellary/config/color.dart';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/presentation/widgets/custom_circle_widget.dart';

class CustomBackgroundGraphicWidget extends StatelessWidget {
  const CustomBackgroundGraphicWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              alignment: Alignment.topCenter,
              constraints:  BoxConstraints(maxHeight: width! >= 600?130: 100, maxWidth: width! >= 600?150:140),
              decoration: const BoxDecoration(
                  image:
                      DecorationImage(image: AssetImage('assets/group.png'))),
            ),
            SizedBox(
              height: 190,
              width: 150,
              child: buildCircleStack(),
            )
          ],
        ),
        SizedBox(
          height: 50,
        ),
        Container(
          alignment: Alignment.center,
          constraints:  BoxConstraints(maxHeight: width! >= 600?130: 100, maxWidth: width! >= 600?150:120),
          decoration: const BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/group1.png'))),
        ),
      ],
    );
  }

  Widget buildCircleStack() => Stack(
        alignment: Alignment.topRight,
        // fit: StackFit.expand,
        children: [
          CustomCircleWidget(r: 45, color: yellow.withOpacity(0.7)),
          Positioned(
              top: 25,
              right: 18,
              child: CustomCircleWidget(r: 50, color: white.withOpacity(0.6))),
          Positioned(
              top: 15,
              right: 65,
              child: CustomCircleWidget(r: 35, color: white.withOpacity(0.8))),
          Positioned(
              top: 100,
              right: 5,
              child: CustomCircleWidget(r: 35, color: white.withOpacity(0.8)))
        ],
      );
}
