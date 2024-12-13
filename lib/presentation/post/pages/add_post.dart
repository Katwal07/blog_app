import 'package:blog_app/common/bloc/button/button_cubit.dart';
import 'package:blog_app/common/bloc/generic_bloc/generic_data_cubit.dart';
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 5.58 * AppSizeConfigs.widthMultiplier,
            ),
            child: Column(
              children: [
                const HeadingBar(title: "Add Post"),
                SizedBox(height: 4 * AppSizeConfigs.heightMultiplier),
                const AddPostListView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
