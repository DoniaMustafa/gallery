import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/presentation/screens/login/blocs/login_cubit.dart';
import 'package:gellary/presentation/screens/login/widgets/background_login_widget.dart';
import 'package:gellary/presentation/screens/login/widgets/in_front_of_login_widget.dart';

import '../../../core/utils/constant.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Stack(
            alignment: Alignment.center,
            children: const [
              BackgroundLoginWidget(),
              InFrontOfLoginWidget(),
            ],
          ),
          BlocBuilder<LoginCubit, LoginState>(builder: (context, state) {
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return const SizedBox();
            }
          })
        ],
      ),
    );
  }
}
