import 'package:blog_app/common/bloc/generic_bloc/generic_data_cubit.dart';
import 'package:blog_app/common/res/size_configs.dart';
import 'package:blog_app/core/configs/assets/app_images.dart';
import 'package:blog_app/core/configs/theme/colors.dart';
import 'package:blog_app/domain/post/entity/user_details.dart';
import 'package:blog_app/domain/post/usecase/get_user_details_usecase.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../common/bloc/generic_bloc/generic_data_state.dart';
import '../../../common/widgets/app_bar/app_bar.dart';
import '../../../common/widgets/container/profile_curved_edge.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: BlocProvider(
        create: (context) => GenericDataCubit()..getData(sl<GetUserDetailsUsecase>()),
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              FractionallySizedBox(
                alignment: Alignment.topCenter,
                heightFactor: 0.5,
                child: ClipPath(
                  clipper: CustomProfileCurvedEdge(),
                  child: Container(
                    color: AppColor.primaryColor,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 5.5 * AppSizeConfigs.widthMultiplier),
                      child: BlocBuilder<GenericDataCubit, GenericDataState>(
                        builder: (context, state) {
                          if(state is DataLoading){
                            return const CircularProgressIndicator.adaptive();
                          }
                          if(state is DataLoaded){
                            final userDetailsEntity = state.data as UserDetailsEntity;
                            return Column(
                            children: [
                              SizedBox(
                                height: 2.1 * AppSizeConfigs.heightMultiplier,
                              ),
                              /// User Avatar
                              _userAvatar(userDetailsEntity),
                              SizedBox(
                                height: 2.1 * AppSizeConfigs.heightMultiplier,
                              ),
                              _userProfile(context,userDetailsEntity),
                              const Spacer(),
                              _aboutUser(context,userDetailsEntity),
                              SizedBox(
                                height: 3.1 * AppSizeConfigs.heightMultiplier,
                              ),
                            ],
                          );
                          }
                          return Container();
                        },
                      ),
                    ),
                  ),
                ),
              ),
              FractionallySizedBox(
                alignment: Alignment.bottomCenter,
                heightFactor: 0.5,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 4 * AppSizeConfigs.widthMultiplier,
                        vertical: 2 * AppSizeConfigs.heightMultiplier),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'My Posts',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        SizedBox(
                          height: 2.1 * AppSizeConfigs.heightMultiplier,
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 10,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 16,
                            crossAxisSpacing: 16,
                            childAspectRatio:
                                (10 * AppSizeConfigs.widthMultiplier) /
                                    (4 * AppSizeConfigs.heightMultiplier),
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    2.32 * AppSizeConfigs.widthMultiplier)),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 3,
                                    child: Image.asset(AppImages.onboard1),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      color: Colors.white,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 1.16 *
                                                AppSizeConfigs.widthMultiplier,
                                            vertical: 0.54 *
                                                AppSizeConfigs
                                                    .heightMultiplier),
                                        child: Text(
                                          "Helloddddddd Heddllddddddddo Hello",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge,
                                          maxLines: 3,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _appBar() {
    return CustomeAppbar(
      backgroundColor: AppColor.primaryColor,
      showBackArrow: false,
      action: [
        Padding(
          padding: EdgeInsets.only(right: 3.5 * AppSizeConfigs.widthMultiplier),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.logout,
              color: Colors.white,
              size: 5.8 * AppSizeConfigs.widthMultiplier,
            ),
          ),
        )
      ],
    );
  }

  Widget _userAvatar(UserDetailsEntity userDetailsEntity) {
    return CircleAvatar(
      backgroundColor: Colors.white,
      radius: 16.27 * AppSizeConfigs.imageSizeMultiplier,
      //backgroundImage: NetworkImage(userDetailsEntity.profilePhotoUrl.toString()),
    );
  }

  Widget _userProfile(BuildContext context, UserDetailsEntity userDetailsEntity) {
    return Column(
      children: [
        Text(
          userDetailsEntity.name ?? "No Name",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: Colors.white),
        ),
        Text(userDetailsEntity.email ?? "No email",
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: Colors.white))
      ],
    );
  }

  Widget _aboutUser(BuildContext context, UserDetailsEntity userDetailsEntity) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              '6',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white),
            ),
            Text(
              'Posts',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Text(
              '6',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white),
            ),
            Text(
              'Following',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Text(
              '6',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Colors.white),
            ),
            Text(
              'Followers',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.white),
            )
          ],
        ),
      ],
    );
  }
}
