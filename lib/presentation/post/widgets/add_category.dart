// import 'package:blog_app/presentation/common/helper/extension.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../common/res/size_configs.dart';
// import '../../../common/widgets/bottom_sheet/category_bottom_sheet.dart';
// import '../../../core/configs/theme/colors.dart';
// import '../bloc/post/category_selection_cubit.dart';
// import '../bloc/post/category_selection_state.dart';

// class CategoryArea extends StatelessWidget {
//   const CategoryArea({super.key});

//   Widget _buildContainer({
//     required BuildContext context,
//     required String text,
//     required VoidCallback onTap,
//   }) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 5.5 * AppSizeConfigs.heightMultiplier,
//         padding: EdgeInsets.symmetric(
//           vertical: 1.5 * AppSizeConfigs.heightMultiplier,
//           horizontal: 20,
//         ),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(1.1 * AppSizeConfigs.heightMultiplier),
//           border: Border.all(color: AppColor.primaryColor),
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(text),
//             const Icon(Icons.chevron_right),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CategorySelectionCubit, CategorySelectionState>(
//       buildWhen: (previous, current) => previous != current,
//       builder: (context, state) {
//         return state.when(
//           initial: () => _buildContainer(
//             context: context,
//             text: "Categories",
//             onTap: () => CategoryBottomSheet.display(context),
//           ),
//           selected: (category) => _buildContainer(
//             context: context,
//             text: category,
//             onTap: () => CategoryBottomSheet.display(context),
//           ),
//           failure: (error) => _buildContainer(
//             context: context,
//             text: error,
//             onTap: () => CategoryBottomSheet.display(context),
//           ),
//         );
//       },
//     );
//   }
// }