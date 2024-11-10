import 'package:blog_app/common/bloc/generic_bloc/generic_data_cubit.dart';
import 'package:blog_app/common/res/size_configs.dart';
import 'package:blog_app/common/widgets/heading_bar/heading_bar.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/tag_list.dart';

class TagsScreen extends StatelessWidget {
  const TagsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 5.58 * AppSizeConfigs.widthMultiplier),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.14 * AppSizeConfigs.heightMultiplier,
                  ),

                  /// Tags Heading
                  HeadingBar(
                    title: "Tags",
                    icon: Icons.add,
                    onPressed: () => Navigator.pushNamed(
                        context, AppRoutesName.addTagsScreen),
                  ),
                  SizedBox(
                    height: 3.21 * AppSizeConfigs.heightMultiplier,
                  ),

                  /// Category List
                  const TagsList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
