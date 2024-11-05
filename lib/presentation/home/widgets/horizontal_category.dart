import 'package:blog_app/common/bloc/generic_bloc/generic_data_cubit.dart';
import 'package:blog_app/common/widgets/container/rounded_container.dart';
import 'package:blog_app/domain/category/usecase/get_category_usecase.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/generic_bloc/generic_data_state.dart';
import '../../../core/configs/theme/colors.dart';

class HorizontalCategory extends StatelessWidget {
  const HorizontalCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData(sl<GetCategoryUsecase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if(state is DataLoading){
            return const CircularProgressIndicator();
          }
          if(state is DataLoaded){
            return  InkWell(
              onTap: (){},
              child: SizedBox(
              height: 54,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: state.data.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: CustomRoundedContainer(
                      height: 48,
                      width: 100,
                      padding: const EdgeInsets.all(5),
                      borderColor: AppColor.secondaryColor1,
                      child: Center(
                        child: Text(
                          state.data[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColor.primaryColor),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  );
                },
              ),
                        ),
            );
          }

          return Container();
         
        },
      ),
    );
  }
}
