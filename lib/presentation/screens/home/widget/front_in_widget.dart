import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gellary/config/color.dart';
import 'package:gellary/config/text_them.dart';
import 'package:gellary/core/dependency_injection/di.dart';
import 'package:gellary/core/utils/constant.dart';
import 'package:gellary/core/utils/curve_clip_widget.dart';
import 'package:gellary/presentation/screens/home/bloc/gallery/gallery_cubit.dart';
import 'package:gellary/presentation/screens/home/bloc/upload/upload_cubit.dart';
import 'package:gellary/presentation/screens/login/login_screen.dart';
import 'package:gellary/presentation/widgets/custom_button_with_img_widget.dart';
import 'package:gellary/presentation/widgets/custom_icon_button_widget.dart';
import 'package:gellary/presentation/widgets/custom_text_widget.dart';

class InFrontOfWidget extends StatelessWidget {
  const InFrontOfWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ClipPath(
      clipper: CurveClip(),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            color: white.withOpacity(0.5),
            padding:
                 EdgeInsets.symmetric(horizontal: width! >= 600?40:20.0, vertical:width! >= 600?40: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(
                  txt: ' Welcome\n ${name} ',
                  style:width! >= 600?textThemeData.headlineMedium: textThemeData.headlineSmall,
                ),
                 SizedBox(height:width! >= 600?100: 50),
                buildActionButtons(context),
                const SizedBox(height: 40),
                Expanded(
                    child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: buildListGallery())),
              ],
            ),
          ),
          BlocBuilder<UploadCubit, UploadState>(builder: (context, state) {
            if (di<UploadCubit>().isSelect == true)
              return buildSelectGallery();
            else
              return Container();
          }),
        ],
      ),
    );
  }

  Widget buildActionButtons(context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomIconButtonWidget(
            label: 'log out',
            icon: Icons.arrow_back_outlined,
            onTap: () => Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false),
            color: red.withOpacity(0.6),
            bodyColor: red,
          ),
          BlocBuilder<UploadCubit, UploadState>(
            builder: (context, state) {
              return CustomIconButtonWidget(
                label: 'upload',
                icon: Icons.arrow_upward,
                onTap: () {
                  print('dvd');
                  di<UploadCubit>().selectGallery();
                },
                color: yellow.withOpacity(0.6),
                bodyColor: yellow,
              );
            },
          ),
        ],
      );

  Widget buildSelectGallery() => Container(
        alignment: Alignment.center,
        constraints: BoxConstraints(maxHeight: 200, maxWidth: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: white.withOpacity(0.6),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButtonWithImgWidget(
                txt: 'Gallery',
                img: 'assets/gallery.png',
                tap: () => di<UploadCubit>().uploadImageCamera('Gallery')),
            const SizedBox(
              height: 20,
            ),
            CustomButtonWithImgWidget(
                txt: 'Camera',
                img: 'assets/camera.png',
                tap: () => di<UploadCubit>().uploadImageCamera('Camera')),
          ],
        ),
      );

  Widget buildListGallery() => BlocBuilder<GalleryCubit, GalleryState>(
        builder: (context, state) {
          if (state is GallerySuccessState && state.galleryModel != null) {
            return GridView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 16, crossAxisSpacing: 15),
              scrollDirection: Axis.vertical,
              children: List.generate(
                di<GalleryCubit>().galleryModel!.data.images.length,
                (index) => Container(
                  alignment: Alignment.center,
                  constraints:
                      const BoxConstraints(maxHeight: 130, maxWidth: 120),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: black,
                      image: DecorationImage(
                          image: NetworkImage(di<GalleryCubit>()
                              .galleryModel!
                              .data
                              .images[index]
                              .toString()),
                          fit: BoxFit.fill)),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
}
