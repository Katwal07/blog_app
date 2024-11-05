import 'package:blog_app/common/res/size_configs.dart';
import 'package:blog_app/core/configs/assets/app_vectors.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:blog_app/presentation/onboard/bloc/onboard_state_cubit.dart';
import 'package:blog_app/presentation/splash/bloc/splash_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../onboard/bloc/onboard_state.dart';
import '../bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SplashStateCubit()..displayCubit(),
        ),
        BlocProvider(
          create: (context) => OnBoardStateCubit()..checkOnBoardStatus(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<OnBoardStateCubit, OnBoardState>(
            listener: (context, state) {
              if (state is OnBoardingComplete) {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutesName.authScreen, (route)=> false);
              }
            },
          ),
          BlocListener<SplashStateCubit, SplashState>(
            listener: (context, state) {
              if (state is SplashUnAuthenticatedState) {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutesName.onboardScreens, (route)=> false);
              }
              if (state is SplashAuthenticatedState) {
                Navigator.pushNamedAndRemoveUntil(
                    context, AppRoutesName.homeScreen,(route)=> false);
              }
            },
          ),
        ],
        child: Scaffold(
          body: Center(
            child: SvgPicture.asset(
              width: 34.65 * AppSizeConfigs.imageSizeMultiplier,
              AppVectors.splashLogo,
            ),
          ),
        ),
      ),
    );
  }
}
