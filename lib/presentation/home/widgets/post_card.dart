import 'package:blog_app/common/bloc/generic_bloc/generic_data_cubit.dart';
import 'package:blog_app/common/res/size_configs.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:blog_app/domain/post/usecase/get_post_usecase.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/generic_bloc/generic_data_state.dart';
import '../../../common/widgets/post/post_card.dart';

class GridViewPostCard extends StatelessWidget {
  const GridViewPostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit()..getData(sl<GetPostUsecase>()),
      child: BlocBuilder<GenericDataCubit, GenericDataState>(
        builder: (context, state) {
          if (state is DataLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          }
          if (state is DataLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<GenericDataCubit>().getData(sl<GetPostUsecase>());
              },
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: (40.2 * AppSizeConfigs.widthMultiplier) /
                      (20 * AppSizeConfigs.heightMultiplier),
                ),
                itemBuilder: (context, index) {
                  final postData = state.data[index];
                  return GestureDetector(
                    onTap: ()=> Navigator.pushNamed(context, AppRoutesName.detailsPost,arguments: postData),
                    child: Postcard(
                      postEntity: state.data[index],
                    ),
                  );
                },
                itemCount: state.data.length,
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
