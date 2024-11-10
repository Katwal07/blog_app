import 'dart:io';

import 'package:blog_app/presentation/post/bloc/image/image_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/res/size_configs.dart';
import '../bloc/image/image_state.dart';


class AddImage extends StatelessWidget {
  const AddImage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ImageCubit, ImageState>(
      buildWhen: (previous, current) => previous != current,  // Optimize rebuilds
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                1.1 * AppSizeConfigs.heightMultiplier,
              ),
              child: _buildImage(state),
            ),
            IconButton(
              onPressed: () => _handleImageButton(context, state),
              icon: Icon(_getIconData(state)),
            ),
          ],
        );
      },
    );
  }

  Widget _buildImage(ImageState state) {
    return switch (state) {
      ImageInitialState() => Image.network(
          "https://cpworldgroup.com/wp-content/uploads/2021/01/placeholder.png",
          frameBuilder: (context, child, frame, loaded) {
            if (loaded) return child;
            return const Center(child: CircularProgressIndicator());
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Error loading image')),
        ),
      ImageLoadedState(imagePath: final path) => Image.file(
          File(path.path),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Error loading image')),
        ),
      FailureImageLoaded(errorMessage: final error) =>
          Center(child: Text(error)),
      // TODO: Handle this case.
      ImageState() => throw UnimplementedError(),
    };
  }

  void _handleImageButton(BuildContext context, ImageState state) {
    if (state is ImageLoadedState) {
      context.read<ImageCubit>().reset();
    } else {
      context.read<ImageCubit>().pickImage();
    }
  }

  IconData _getIconData(ImageState state) {
    return state is ImageLoadedState
        ? Icons.camera_outdoor_sharp
        : Icons.camera_enhance;
  }
}