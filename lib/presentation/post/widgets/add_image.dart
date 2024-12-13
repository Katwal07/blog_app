// import 'dart:io';
// import 'package:blog_app/presentation/post/bloc/image/image_cubit.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../common/res/size_configs.dart';
// import '../bloc/image/image_state.dart';

// class AddImage extends StatelessWidget {
//   const AddImage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<ImageCubit, ImageState>(
//       builder: (context, state) {
//         print("Current state in BlocBuilder: $state");
//         if (state is ImageInitialState) {
//           return Stack(
//             alignment: Alignment.bottomRight,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(
//                   1.1 * AppSizeConfigs.heightMultiplier,
//                 ),
//                 child: Image.network(
//                   "https://cpworldgroup.com/wp-content/uploads/2021/01/placeholder.png",
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   context.read<ImageCubit>().pickImage();
//                 },
//                 icon: const Icon(Icons.image),
//               ),
//             ],
//           );
//         }
//         if (state is ImageLoadedState) {
//           return Stack(
//             alignment: Alignment.bottomRight,
//             children: [
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(
//                   1.1 * AppSizeConfigs.heightMultiplier,
//                 ),
//                 child: Image.file(
//                   File(state.imagePath),
//                   height: MediaQuery.of(context).size.height / 3,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//               ),
//               IconButton(
//                 onPressed: () {
//                   context.read<ImageCubit>().pickImage();
//                 },
//                 icon: const Icon(Icons.image),
//               ),
//             ],
//           );
//         }
//         if (state is FailureImageLoaded) {
//           return Stack(
//             alignment: Alignment.bottomRight,
//             children: [
//               ClipRRect(
//                   borderRadius: BorderRadius.circular(
//                     1.1 * AppSizeConfigs.heightMultiplier,
//                   ),
//                   child: Center(
//                     child: Text(state.errorMessage),
//                   )),
//               IconButton(
//                 onPressed: () {
//                   context.read<ImageCubit>().pickImage();
//                 },
//                 icon: const Icon(Icons.image),
//               ),
//             ],
//           );
//         }
//         if (state is ImageLoadingState) {
//           return const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         return const SizedBox();
//       },
//     );
//   }
// }
