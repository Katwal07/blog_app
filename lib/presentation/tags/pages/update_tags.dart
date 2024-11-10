import 'package:blog_app/common/bloc/button/button_cubit.dart';
import 'package:blog_app/common/bloc/button/button_state.dart';
import 'package:blog_app/common/widgets/button/reactive_elevated_button.dart';
import 'package:blog_app/common/widgets/heading_bar/heading_bar.dart';
import 'package:blog_app/common/widgets/textfield/text_field.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:blog_app/domain/tags/entity/tags.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/res/size_configs.dart';
import '../../../core/configs/theme/colors.dart';
import '../../../data/tags/models/update_tags.dart';
import '../../../domain/tags/usecases/update_tags_usecase.dart';

class UpdateTagsScreen extends StatelessWidget {
  UpdateTagsScreen({super.key, required this.tagsEntity});

  final TagsEntity tagsEntity;
  final TextEditingController _titleCon = TextEditingController();
  final TextEditingController _slugCon = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonLoading) {
            const Center(child: CircularProgressIndicator());
          }
          if (state is ButtonLoaded) {
            var snackBar = SnackBar(content: Text(state.message));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutesName.navigationBar, (route) => false, arguments: 3);
          }
          if(state is FailureButtonLoad){
            var snackBar = SnackBar(content: Text(state.errorMessage));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
                      title: "Update Tags",
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
                
                    /// Add category Button
                
                    _updateTagButton(context),
                
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
      hintText: tagsEntity.title!,
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
      hintText: tagsEntity.slug!,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Enter slug you want to update";
        }
        return null;
      },
    );
  }

  Widget _updateTagButton(BuildContext context) {
    return Builder(builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: ReactiveElevatedButton(
            onPressed: () {
              if(formKey.currentState!.validate()){
                context.read<ButtonCubit>().execute(
                    usecase: sl<UpdateTagsUsecase>(),
                    params: UpdateTagsModel(
                      id: tagsEntity.id.toString(),
                        title: _titleCon.text, 
                        slug: _slugCon.text),
                  );
              }
            },
            label: "Update Tags"),
      );
    });
  }
}
