import 'package:flutter/material.dart';
import 'package:gellary/presentation/screens/login/widgets/background_login_widget.dart';
import 'package:gellary/presentation/screens/login/widgets/in_front_of_login_widget.dart';

import '../../../core/utils/constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    width =MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children:const [
            BackgroundLoginWidget(),
              InFrontOfLoginWidget(),
          ],
        ),
      ),
    );
  }


  }
