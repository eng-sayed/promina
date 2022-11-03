import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../componants/loadinganderror.dart';
import '../cubit/gallery_cubit.dart';

class GridImages extends StatelessWidget {
  const GridImages({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = GalleryCubit.get(context);

    return BlocConsumer<GalleryCubit, GalleryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: LoadingAndError(
                isLoading: state is GalleryLoading,
                isError: state is GalleryFail,
                child: GridView.builder(
                  itemCount: cubit.galleryModel.data?.images?.length,
                  gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: (MediaQuery.of(context).orientation ==
                              Orientation.portrait)
                          ? 3
                          : 5,
                      crossAxisSpacing: 25.0,
                      mainAxisSpacing: 10.0),
                  itemBuilder: (BuildContext context, int index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Image.network(
                        cubit.galleryModel.data!.images![index],
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        });
  }
}
