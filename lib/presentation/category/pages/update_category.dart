import 'package:blog_app/common/bloc/button/button_cubit.dart';
import 'package:blog_app/common/widgets/button/reactive_elevated_button.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:blog_app/data/category/model/update_category.dart';
import 'package:blog_app/domain/category/entity/category.dart';
import 'package:blog_app/domain/category/usecase/update_category_usecase.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/bloc/button/button_state.dart';
import '../../../common/res/size_configs.dart';
import '../../../common/widgets/heading_bar/heading_bar.dart';
import '../../../common/widgets/textfield/text_field.dart';
import '../../../core/configs/theme/colors.dart';

class UpdateCategoryScreen extends StatelessWidget {
  UpdateCategoryScreen({super.key, required this.categoryEntity});

  final CategoryEntity categoryEntity;
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _slugCon = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is FailureButtonLoad) {
            var snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is ButtonLoaded) {
            var snackBar = SnackBar(content: Text(state.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutesName.navigationBar, (route) => false, arguments: 1);
          }
        },
        child: Scaffold(
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.58 * AppSizeConfigs.widthMultiplier,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 2.14 * AppSizeConfigs.heightMultiplier,
                    ),
                    const HeadingBar(
                      title: "Update Category",
                    ),
                    SizedBox(
                      height: 4 * AppSizeConfigs.heightMultiplier,
                    ),

                    /// Title Header
                    _titleHeader(context),
                    SizedBox(
                      height: 1 * AppSizeConfigs.heightMultiplier,
                    ),

                    /// Title TextField
                    _titleTextField(),
                    SizedBox(
                      height: 2.14 * AppSizeConfigs.heightMultiplier,
                    ),

                    /// Slug Header
                    _slugHeader(context),
                    SizedBox(
                      height: 1 * AppSizeConfigs.heightMultiplier,
                    ),

                    /// Slug TextField
                    _slugTextField(),

                    const Spacer(),

                    /// Update category Button

                    _updateCategoryButton(context),

                    SizedBox(
                      height: 2.14 * AppSizeConfigs.heightMultiplier,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _titleHeader(BuildContext context) {
    return Text(
      " Title",
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColor.primaryColor),
    );
  }

  Widget _titleTextField() {
    return CustomTextField(
      controller: _titleCon,
      hintText: categoryEntity.title ?? "No title",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter title you want to update";
        }
        return null;
      },
    );
  }

  Widget _slugHeader(BuildContext context) {
    return Text(
      " Slug",
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColor.primaryColor),
    );
  }

  Widget _slugTextField() {
    return CustomTextField(
      controller: _slugCon,
      hintText: categoryEntity.slug ?? "No slug",
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter slug you want to update";
        }
        return null;
      },
    );
  }

  Widget _updateCategoryButton(BuildContext context) {
    return Builder(builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: ReactiveElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                context.read<ButtonCubit>().execute(
                      usecase: sl<UpdateCategoryUsecase>(),
                      params: UpdateCategoryModel(
                          id: categoryEntity.id.toString(),
                          title: _titleCon.text,
                          slug: _slugCon.text),
                    );
              }
            },
            label: "Update Category"),
      );
    });
  }
}
