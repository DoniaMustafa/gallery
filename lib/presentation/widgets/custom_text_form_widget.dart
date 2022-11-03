import 'package:flutter/material.dart';
import 'package:gellary/config/color.dart';
import 'package:gellary/config/text_them.dart';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/presentation/widgets/custom_text_widget.dart';

class CustomTextFormWidget extends StatelessWidget {
  CustomTextFormWidget({
    Key? key,
    required this.txtField,
    this.controller,
    required this.val,
  }) : super(key: key);
  final String txtField;
  TextEditingController? controller;
  final String val;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: width! >= 600?textThemeData.titleMedium:textThemeData.bodyLarge,
      // maxLines: ,
      controller: controller,
      validator: (String? validate) {
        if (validate!.isEmpty) {
          return val;
        }
      },
      decoration: InputDecoration(
          filled: true,
          fillColor: white.withOpacity(0.7),
          focusedBorder: OutlineInputBorder(
            borderSide:const BorderSide(color: white),
            borderRadius: BorderRadius.circular(30.0),
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(30.0),
              gapPadding: 10.0),
          label: CustomTextWidget(
            txt: txtField,
            style:width! >= 600?textThemeData.titleMedium: textThemeData.bodyLarge,
          ),
          constraints: const BoxConstraints(
            maxWidth: 400,
          )),
    );
  }
}
