import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../componants/customtext.dart';
import '../../../componants/glass_moriphism.dart';
import '../cubit/gallery_cubit.dart';
import 'custom_button.dart';

class DialgImages extends StatelessWidget {
  DialgImages({super.key});
  File? pickedImage;
  @override
  Widget build(BuildContext context) {
    final cubit = GalleryCubit.get(context);

    return BlocConsumer<GalleryCubit, GalleryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Dialog(
              backgroundColor: Colors.transparent,
              child: GlassMorphism(
                width: 388,
                height: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomButton(
                          width: 184,
                          height: 68,
                          textStyleEnum: TextStyleEnum.title,
                          size: 27,
                          imageName: 'gallery',
                          function: () async {
                            final ImagePicker _picker = ImagePicker();
                            final XFile? image = await _picker.pickImage(
                                source: ImageSource.gallery, imageQuality: 50);
                            pickedImage = File(image!.path);
                            await cubit.addImage(context, pickedImage!);
                          },
                          color: Color(0xffEFD8F9),
                          text: 'Gallery',
                        ),
                        CustomButton(
                          width: 184,
                          height: 68,
                          textStyleEnum: TextStyleEnum.title,
                          size: 27,
                          imageName: 'scam',
                          function: () async {
                            final ImagePicker _picker = ImagePicker();

                            final XFile? image = await _picker.pickImage(
                                imageQuality: 50, source: ImageSource.camera);
                            pickedImage = File(image!.path);
                            await cubit.addImage(context, pickedImage!);
                          },
                          color: Color(0xffEBF6FF),
                          text: 'Camera',
                        ),
                      ],
                    ),
                  ],
                ),
                start: .7,
                end: 0.07,
              ));
        });
  }
}
