import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/config/color.dart';
import 'package:gellary/config/text_them.dart';
import 'package:gellary/core/dependency_injection/di.dart';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/presentation/screens/home/home_screen.dart';
import 'package:gellary/presentation/screens/login/blocs/login_cubit.dart';
import 'package:gellary/presentation/widgets/custom_button_widget.dart';
import 'package:gellary/presentation/widgets/custom_text_form_widget.dart';
import 'package:gellary/presentation/widgets/custom_text_widget.dart';

class InFrontOfLoginWidget extends StatelessWidget {
  const InFrontOfLoginWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:  BoxConstraints(maxWidth: width! >= 600?550:350, maxHeight: width! >= 600?500: 350),
      margin:const EdgeInsets.only(top: 280),
      padding:const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: white.withOpacity(0.5),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextWidget(
            txt: 'Log in'.toUpperCase(),
            style:  width! >= 600?textThemeData.headlineMedium!.copyWith(color: black):textThemeData.titleLarge!.copyWith(color: black),
          ),
          const SizedBox(
            height: 20.0,
          ),
          buildFormWidget(),
          const SizedBox(
            height: 20.0,
          ),
          buildSubmitButton(),
        ],
      ),
    );
  }

  Widget buildFormWidget() => Form(
        key: di<LoginCubit>().key,
        child: Column(
          children: [
            CustomTextFormWidget(
                controller: di<LoginCubit>().email,
                txtField: 'Email',
                val: 'Enter your Email',
               ),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextFormWidget(
                controller: di<LoginCubit>().pass,
                txtField: 'Password',
                val: 'Enter your password',

                ),
          ],
        ),
      );

  Widget buildSubmitButton() => BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is SuccessState && state.user != null) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => HomeScreen()));
          }
        },
        builder: (context, state) {
          return CustomButtonWidget(
              txt: 'Submit',
              onPress: () {
                if (di<LoginCubit>().key.currentState!.validate()) {
                  di<LoginCubit>().login();
                }
                return;
              });
        },
      );
}
