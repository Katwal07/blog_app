import 'package:blog_app/common/res/size_configs.dart';
import 'package:blog_app/core/configs/assets/app_vectors.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:blog_app/presentation/splash/bloc/splash_state_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashStateCubit()..displayCubit(),
      child: BlocListener<SplashStateCubit, SplashState>(
        listener: (context, state) {
          if(state is SplashAuthenticatedState){
            Navigator.pushReplacementNamed(context, AppRoutesName.onboardScreens);
          }
        },
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
