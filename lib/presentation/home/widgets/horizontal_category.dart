import 'package:blog_app/common/bloc/generic_bloc/generic_data_cubit.dart';
import 'package:blog_app/common/res/size_configs.dart';
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
      create: (context) =>
          GenericDataCubit()..getData(sl<GetCategoryUsecase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(
                child: CircularProgressIndicator.adaptive(
              backgroundColor: Colors.white,
            ));
          }
          if (state is DataLoaded) {
            return InkWell(
              onTap: () {},
              child: SizedBox(
                height: 6 * AppSizeConfigs.heightMultiplier,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: state.data.length,
                  itemBuilder: (context, index) {
                    var catData = state.data[index];
                    return Padding(
                      padding:  EdgeInsets.only(right: 4.65 * AppSizeConfigs.widthMultiplier),
                      child: CustomRoundedContainer(
                        padding: EdgeInsets.only(left: 2.32 * AppSizeConfigs.widthMultiplier, right: 2.32 * AppSizeConfigs.widthMultiplier, top:1 * AppSizeConfigs.heightMultiplier , bottom: 1 * AppSizeConfigs.heightMultiplier,),
                        borderColor: AppColor.primaryColor,
                        child: Center(
                          child: Text(
                            catData.title,
                            style:
                                Theme.of(context).textTheme.bodyLarge!.copyWith(
                                      color: AppColor.primaryColor,
                                    ),
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
