import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/core/utils/utils.dart';
import 'package:promina/presentation/componants/customtext.dart';
import 'package:promina/presentation/layout/gallery/cubit/gallery_cubit.dart';

import '../../../componants/blur_shape_gallery.dart';
import '../../../componants/default_button.dart';

class GalleryScreen extends StatefulWidget {
  const GalleryScreen({super.key});

  @override
  State<GalleryScreen> createState() => _GalleryScreenState();
}

class _GalleryScreenState extends State<GalleryScreen> {
  @override
  void initState() {
    final cubit = GalleryCubit.get(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      cubit.getImage(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = GalleryCubit.get(context);

    return BlocConsumer<GalleryCubit, GalleryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.blue,
            body: SafeArea(
              child: Stack(children: [
                Image.asset(
                  'assets/images/login.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                CustomPaint(
                  size: Size(2000, (1900 * 2.109588189657182).toDouble()),
                  // size: Size(
                  //     1090,
                  //     (1900)
                  //         .toDouble()), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically

                  painter: RPSCustomPainter(),
                ),
                Column(
                  children: [
                    Container(
                      height: 200,
                      child: Column(children: [
                        Row(
                          children: [CustomText(Utiles.name)],
                        )
                      ]),
                    ),
                    if (state is GallerySucsses)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: GridView.builder(
                            itemCount: cubit.galleryModel.data?.images?.length,
                            gridDelegate:
                                new SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount:
                                        (MediaQuery.of(context).orientation ==
                                                Orientation.portrait)
                                            ? 3
                                            : 5,
                                    crossAxisSpacing: 25.0,
                                    mainAxisSpacing: 10.0),
                            itemBuilder: (BuildContext context, int index) {
                              return ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                child: Image.network(
                                  cubit.galleryModel.data!.images![index],
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                )

                // defaultButton(
                //   text: 'SUBMIT',
                //   function: () {
                //     cubit.getImage(
                //       context,
                //     );
                //   },
                // ),
              ]),
            ),
          );
        });
  }
}
