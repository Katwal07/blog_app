import 'package:blog_app/presentation/post/bloc/post/tags_selection_cubit.dart';
import 'package:blog_app/presentation/post/bloc/post/tags_selection_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/res/size_configs.dart';
import '../../../common/widgets/bottom_sheet/tags_button_sheet.dart';
import '../../../core/configs/theme/colors.dart';


class AddPostTags extends StatelessWidget {
  const AddPostTags({super.key});

  Widget _buildContainer({
    required BuildContext context,
    required String text,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 5.5 * AppSizeConfigs.heightMultiplier,
        padding: EdgeInsets.symmetric(
          vertical: 1.5 * AppSizeConfigs.heightMultiplier,
          horizontal: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(1.1 * AppSizeConfigs.heightMultiplier),
          border: Border.all(color: AppColor.primaryColor),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(text),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TagsSelectionCubit, TagsSelectionState>(
      buildWhen: (previous, current) => previous != current,  // Optimize rebuilds
      builder: (context, state) {
        return state.when(
          initial: () => _buildContainer(
            context: context,
            text: "Tags",
            onTap: () => TagsBottomSheet.display(context),
          ),
          selected: (tags) => _buildContainer(
            context: context,
            text: tags,
            onTap: () => TagsBottomSheet.display(context),
          ),
          failure: (error) => _buildContainer(
            context: context,
            text: error,
            onTap: () => TagsBottomSheet.display(context),
          ),
        );
      },
    );
  }
}

extension on TagsSelectionState {
   T when<T>({
    required T Function() initial,
    required T Function(String) selected,
    required T Function(String) failure,
  }) {
    return switch (this) {
      TagsSelectionInitial() => initial(),
      TagsSelected(selectedTags: final category) => selected(category),
      TagsSelectionFailure(errorMessage: final msg) => failure(msg),
      // TODO: Handle this case.
      TagsSelectionState() => throw UnimplementedError(),
    };
  }
}