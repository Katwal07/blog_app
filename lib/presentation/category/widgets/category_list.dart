import 'package:blog_app/common/bloc/generic_data_cubit.dart';
import 'package:blog_app/domain/category/usecase/get_category_usecase.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/generic_data_state.dart';
import '../../../core/configs/theme/colors.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()
        ..getData(
          sl<GetCategoryUsecase>(),
        ),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const CircularProgressIndicator();
          }
          if (state is DataLoaded) {
            return ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                int displayIndex = index+1;
                return Container(
                  height: 70,
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColor.secondaryColor2,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(displayIndex.toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(state.data[index].title),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.delete),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
              itemCount: 9,
            );
          }
          return Container();
        },
      ),
    );
  }
}
