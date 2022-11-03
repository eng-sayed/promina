import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:promina/presentation/layout/gallery/cubit/gallery_cubit.dart';
import '../../../componants/blur_shape_gallery.dart';
import '../widgets/grid_images.dart';
import '../widgets/header_gallery_screen.dart';

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
                  'assets/images/background.png',
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.fill,
                ),
                CustomPaint(
                  size: Size(MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height),
                  painter: RPSCustomPainter(),
                ),
                Column(
                  children: [HeaderGalleryScreen(), GridImages()],
                )
              ]),
            ),
          );
        });
  }
}
