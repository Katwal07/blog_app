import 'package:blog_app/common/bloc/generic_bloc/generic_data_cubit.dart';
import 'package:blog_app/common/res/size_configs.dart';
import 'package:blog_app/domain/category/entity/category.dart';
import 'package:blog_app/domain/category/usecase/get_category_usecase.dart';
import 'package:blog_app/presentation/post/bloc/post/category_selection_cubit.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/generic_bloc/generic_data_state.dart';

class CategoryBottomSheet {
  static Future<void> display(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
        ),
      ),
      backgroundColor: Colors.white,
      builder: (_) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context)=>  
                  GenericDataCubit()..getData(sl<GetCategoryUsecase>()),
            ),
            BlocProvider.value(
            value:  context.read<CategorySelectionCubit>(),
            ),
          ],
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: BlocBuilder<GenericDataCubit, GenericDataState>(
              builder: (context, state) {
                if (state is DataLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is DataLoaded) {
                  final categoryEntity = state.data as List<CategoryEntity>;
                  return _categories(categoryEntity);
                  
                }
                if (state is FailureLoadData) {
                  return Center(
                    child: Text(state.errorMessage),
                  );
                }

                return Container();
              },
            ),
          ),
        );
      },
    );
  }

  static Widget _categories(List<CategoryEntity> categoryEntity) {
    return ListView.separated(
      padding: EdgeInsets.symmetric(
          vertical: 3.21 * AppSizeConfigs.heightMultiplier,
          horizontal: 9.5 * AppSizeConfigs.widthMultiplier),
      itemBuilder: (context, index) {
        final categories = categoryEntity[index];
        return GestureDetector(
          onTap: () {
            
            context.read<CategorySelectionCubit>().selectCategory(
              categories.title ?? "No Title"
            );
            Navigator.pop(context);
          },
          child: Text(categories.title ?? "No Title"),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(
          height: 2.15 * AppSizeConfigs.heightMultiplier,
        );
      },
      itemCount: categoryEntity.length,
    );
  }
}
