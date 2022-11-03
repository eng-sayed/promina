import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/presentation/layout/gallery/widgets/dialg_image.dart';

import '../../../../core/themes/colors.dart';
import '../../../../core/utils/utils.dart';
import '../../../componants/customtext.dart';
import '../cubit/gallery_cubit.dart';
import 'custom_button.dart';

class HeaderGalleryScreen extends StatelessWidget {
  const HeaderGalleryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = GalleryCubit.get(context);

    return BlocConsumer<GalleryCubit, GalleryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Container(
            height: 200,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              'Welcome',
                              textStyleEnum: TextStyleEnum.normal,
                              fontsize: 32,
                            ),
                            CustomText(
                              Utiles.name,
                              textStyleEnum: TextStyleEnum.normal,
                              fontsize: 32,
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 33,
                        backgroundImage: AssetImage('assets/images/person.png'),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CustomButton(
                        imageName: 'left',
                        function: () {
                          cubit.logout(context);
                        },
                        color: AppColors.white,
                        text: 'log out',
                      ),
                      CustomButton(
                        imageName: 'up',
                        function: () {
                          showDialog<void>(
                            barrierColor: null,
                            context: context,
                            builder: (BuildContext context) {
                              return DialgImages();
                            },
                          );
                        },
                        color: AppColors.white,
                        text: 'upload',
                      ),
                    ],
                  )
                ]),
          );
        });
  }
}
