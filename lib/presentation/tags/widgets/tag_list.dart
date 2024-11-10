import 'package:blog_app/common/bloc/generic_bloc/generic_data_cubit.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:blog_app/domain/tags/usecases/get_tags_usecase.dart';
import 'package:blog_app/presentation/tags/bloc/tags_deletion_cubit.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../common/bloc/generic_bloc/generic_data_state.dart';
import '../../../common/res/size_configs.dart';
import '../../../core/configs/theme/colors.dart';
import '../bloc/tags_deletion_state.dart';

class TagsList extends StatelessWidget {
  const TagsList({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GenericDataCubit()
            ..getData(
              sl<GetTagsUsecase>(),
            ),
        ),
        BlocProvider(
          create: (context) => TagsDeletionCubit(),
        ),
      ],
      child: BlocListener<TagsDeletionCubit, TagsDeletionState>(
        listener: (context, state) {
         if (state is TagsDeleted) {
            context.read<GenericDataCubit>().getData(sl<GetTagsUsecase>());
            var snackBar = SnackBar(content: Text(state.message));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
          if (state is FailureTagDeletion) {
            var snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: BlocBuilder<GenericDataCubit, GenericDataState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const CircularProgressIndicator();
            }
            if (state is DataLoaded) {
              return SizedBox(
                height: 70 * AppSizeConfigs.heightMultiplier,
                child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    int displayIndex = index + 1;
                    var tagData = state.data[index];
                    int tagId = state.data[index].id;
                    return Container(
                      height: 7.5 * AppSizeConfigs.heightMultiplier,
                      padding:
                          EdgeInsets.all(2.7 * AppSizeConfigs.widthMultiplier),
                      decoration: BoxDecoration(
                        color: AppColor.secondaryColor2,
                        borderRadius: BorderRadius.circular(
                            1.86 * AppSizeConfigs.widthMultiplier),
                      ),
                      child: Row(
                        children: [
                          Text(displayIndex.toString()),
                          SizedBox(
                            width: 2.3 * AppSizeConfigs.widthMultiplier,
                          ),
                          Text(state.data[index].title),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, AppRoutesName.updateTag,
                                  arguments: tagData);
                            },
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.green,
                            ),
                          ),
                          Builder(builder: (context) {
                            return IconButton(
                              onPressed: () {
                                context
                                    .read<TagsDeletionCubit>()
                                    .deleteTags(tagId.toString());
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            );
                          }),
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 1 * AppSizeConfigs.heightMultiplier,
                  ),
                  itemCount: state.data.length,
                ),
              );
            }
            return Container();
          },
        ),
      ),
    );
  }
}
