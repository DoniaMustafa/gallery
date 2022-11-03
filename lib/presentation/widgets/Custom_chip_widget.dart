import 'package:flutter/material.dart';
import 'package:gellary/core/utils/constant.dart';

class CustomChipWidget extends StatelessWidget {
  const CustomChipWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children: [
        Padding(
          padding:  EdgeInsets.only(top: width!>=600 ?10:100.0),
          child: SizedBox(
            height: 400,
            child: Stack(
              children: [
                Positioned(
                  width: 135,
                  height: 135,
                  top: 90,
                  left: 5,
                  child: Image.asset(
                    img[0],
                    color: Colors.black,
                    // height: 150,
                    // width: 150,
                  ),
                ),
                Positioned(
                  width: 150,
                  height: 150,
                  top: 82,
                  left: -2,
                  child: Image.asset(
                    img[1],
                    color: Colors.black45,
                  ),
                ),
                Positioned(
                  width: 170,
                  height: 170,
                  top: 72,
                  left: -12,
                  child: Image.asset(
                    img[2],
                    color: Colors.black45,
                  ),
                ),
                Positioned(
                  width: 200,
                  height: 200,
                  top: 60,
                  left: -24,
                  child: Image.asset(
                    img[3],
                    color: Colors.black45,
                  ),
                ),
                Positioned(
                  width: 240,
                  height: 240,
                  top: 45,
                  left: -45,
                  child: Image.asset(
                    img[4],
                    color: Colors.black45,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );}
}
