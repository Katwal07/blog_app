import 'dart:io';
import 'package:blog_app/common/bloc/button/button_cubit.dart';
import 'package:blog_app/common/widgets/button/reactive_elevated_button.dart';
import 'package:blog_app/data/post/model/add_post.dart';
import 'package:blog_app/domain/post/usecase/add_post_usecase.dart';
import 'package:blog_app/presentation/post/bloc/image/image_cubit.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/res/size_configs.dart';
import '../../../common/widgets/textfield/text_field.dart';
import 'add_category.dart';
import 'add_image.dart';
import 'add_tags.dart';

class AddPostListView extends StatefulWidget {
  const AddPostListView({
    super.key,
  });

  @override
  State<AddPostListView> createState() => _AddPostListViewState();
}

class _AddPostListViewState extends State<AddPostListView> {
  final TextEditingController _titleCon = TextEditingController();

  final TextEditingController _slugCon = TextEditingController();

  //final TextEditingController _bodyCon = TextEditingController();
  @override
  void dispose() {
    _titleCon.dispose();
    _slugCon.dispose();
    super.dispose();
  }

  Future<void> _handleAddPost(BuildContext context) async {
    // Image validation
    final ImageCubit imageCubit = context.read<ImageCubit>();
    final String? featureImage = imageCubit.getSelectedImagePath();

    if (featureImage == null) {
      _showSnackBar(context, 'Please select an image');
      return;
    }

    try {
      context.read<ButtonCubit>().execute(
            usecase: sl<AddPostUsecase>(),
            params: AddPostModel(
              title: "_titleCon.text",
              slug: "_slugCon.text",
              categories: "187",
              tags: "571",
              body: "body",
              featuredimage: File(featureImage),
              userId: 164,
            ),
          );
    } catch (e) {
      if (mounted) {
        _showSnackBar(context, 'Error adding post: ${e.toString()}');
      }
    }
  }

  void _showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70 * AppSizeConfigs.heightMultiplier,
      child: ListView(
        children: [
          /// Add Image
          const AddImage(),

          _buildSpacing(),

          /// Title Area
          CustomTextField(controller: _titleCon, hintText: "Title"),
          _buildSpacing(),

          /// Slug Area
          CustomTextField(controller: _slugCon, hintText: "slug"),
          _buildSpacing(),

          /// Tags Area
          const AddPostTags(),

          _buildSpacing(),

          /// Category Area
          const CategoryArea(),

          /// Post Description Area
          _buildSpacing(),

          _buildAddButton(context),

          // /// Add Button
          // Builder(builder: (context) {
          //   return ReactiveElevatedButton(
          //       onPressed: () {
          //         // Category
          //         // final categorySelectionCubit =
          //         //     context.read<CategorySelectionCubit>();
          //         // final selectedCategory =
          //         //     categorySelectionCubit.getSelectedCategory();

          //         /// Tags
          //         // final tagSelectionCubit = context.read<TagsSelectionCubit>();
          //         // final selectedTags = tagSelectionCubit.getSelectedTag();

          //         // if (selectedTags == null) {
          //         //   ScaffoldMessenger.of(context).showSnackBar(
          //         //     const SnackBar(content: Text('Please provide Tag')),
          //         //   );
          //         //   return;
          //         // }

          //         // if (selectedCategory == null) {
          //         //   ScaffoldMessenger.of(context).showSnackBar(
          //         //     const SnackBar(content: Text('Plesae provide category')),
          //         //   );
          //         //   return;
          //         // }

          //         // UserID
          //         // final GenericDataCubit genericDataCubit =
          //         //     context.read<GenericDataCubit>();
          //         // final userId = genericDataCubit.getUserId();

          //         // if (userId == null) {
          //         //   ScaffoldMessenger.of(context).showSnackBar(
          //         //     const SnackBar(content: Text('User ID not found')),
          //         //   );
          //         //   return;
          //         // }

          //         //Image
          //         final ImageCubit imageCubit = context.read<ImageCubit>();
          //         final String? featureImage =
          //             imageCubit.getSelectedImagePath();

          //         if (featureImage == null) {
          //           ScaffoldMessenger.of(context).showSnackBar(
          //             const SnackBar(content: Text('Please select an image')),
          //           );
          //           return;
          //         }

          //         // if (_titleCon.text.isEmpty ||
          //         //     _slugCon.text.isEmpty ||
          //         //     _bodyCon.text.isEmpty) {
          //         //   ScaffoldMessenger.of(context).showSnackBar(
          //         //     const SnackBar(
          //         //         content: Text('Please fill all required fields')),
          //         //   );
          //         //   return;
          //         // }
          //         // debugPrint("title:${_titleCon.text}");
          //         // debugPrint("title:${_slugCon.text}");
          //         // debugPrint("Selected Category: $selectedCategory");
          //         // debugPrint("Selected Tag:$selectedTags");
          //         // debugPrint("Body:${_bodyCon.text}");
          //         // debugPrint("UserId: ${userId.toString()}");
          //         // debugPrint("FeatureImage: $featureImage");

          //         context.read<ButtonCubit>().execute(
          //               usecase: sl<AddPostUsecase>(),
          //               params: AddPostModel(
          //                 title: "_titleCon.text",
          //                 slug: "_slugCon.text",
          //                 categories: "187",
          //                 tags: "571",
          //                 body: "body",
          //                 featuredimage: File(featureImage),
          //                 userId: 164,
          //               ),
          //             );
          //       },
          //       label: "ADD"
          //       );
          // }),

          _buildSpacing(),
        ],
      ),
    );
  }

  Widget _buildSpacing() {
    return SizedBox(
      height: 2.14 * AppSizeConfigs.heightMultiplier,
    );
  }

  Widget _buildAddButton(BuildContext context) {
    return ReactiveElevatedButton(
      onPressed: () => _handleAddPost(context),
      label: "ADD",
    );
  }
}
