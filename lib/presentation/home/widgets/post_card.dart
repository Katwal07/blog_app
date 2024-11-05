import 'package:blog_app/common/bloc/generic_data_cubit.dart';
import 'package:blog_app/domain/post/usecase/get_post_usecase.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/generic_data_state.dart';
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
            return const CircularProgressIndicator();
          }
          if (state is DataLoaded) {
            return GridView.builder(
              physics: const BouncingScrollPhysics(),
              
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 173 / 219),
              itemBuilder: (context, index) {
                return Postcard(postEntity: state.data[index],);
                
              },
              itemCount: state.data.length,
            );
          }
          return Container();
        },
      ),
    );
  }
}
