import 'package:blog_app/common/bloc/button/button_cubit.dart';
import 'package:blog_app/common/bloc/generic_bloc/generic_data_cubit.dart';
import 'package:blog_app/presentation/post/bloc/image/image_cubit.dart';
import 'package:blog_app/presentation/post/bloc/post/category_selection_cubit.dart';
import 'package:blog_app/presentation/post/bloc/post/tags_selection_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/res/size_configs.dart';
import '../../../common/widgets/heading_bar/heading_bar.dart';
import '../widgets/add_post_listview.dart';

class AddPostScreen extends StatelessWidget {
  const AddPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => CategorySelectionCubit()),
          BlocProvider(create: (_) => TagsSelectionCubit()),
          BlocProvider(create: (_) => ImageCubit()),
          BlocProvider(create: (_) => ButtonCubit()),
          BlocProvider(create: (_) => GenericDataCubit()),
        ],
        child: SafeArea(
          child: SingleChildScrollView(  // Added to prevent overflow
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.58 * AppSizeConfigs.widthMultiplier,
              ),
              child: Column(
                children: [
                  const HeadingBar(title: "Add Post"),
                  SizedBox(height: 4 * AppSizeConfigs.heightMultiplier),
                  const AddPostListView(),  // Made const
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}