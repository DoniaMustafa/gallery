import 'package:flutter/material.dart';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/presentation/screens/home/widget/background_widget.dart';
import 'package:gellary/presentation/screens/home/widget/front_in_widget.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    print(width);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundWidget(),
            InFrontOfWidget()

          ],
        ),
      ),
    );
  }
}


