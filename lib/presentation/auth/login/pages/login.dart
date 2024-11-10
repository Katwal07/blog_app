import 'package:blog_app/common/bloc/button/button_cubit.dart';
import 'package:blog_app/common/bloc/button/button_state.dart';
import 'package:blog_app/common/validators/validators.dart';
import 'package:blog_app/common/widgets/app_bar/app_bar.dart';
import 'package:blog_app/common/widgets/button/reactive_elevated_button.dart';
import 'package:blog_app/common/widgets/container/curve_edge.dart';
import 'package:blog_app/common/widgets/textfield/text_field.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:blog_app/core/configs/theme/colors.dart';
import 'package:blog_app/core/constants/app_string.dart';
import 'package:blog_app/data/auth/model/signin_req_params.dart';
import 'package:blog_app/domain/auth/usecases/login_usecase.dart';
import 'package:blog_app/presentation/auth/login/bloc/checkbox/checkbox_cubit.dart';
import 'package:blog_app/presentation/auth/login/bloc/checkbox/checkbox_state.dart';
import 'package:blog_app/presentation/auth/login/bloc/pass_visibility_cubit.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../common/res/size_configs.dart';
import '../../../../core/configs/assets/app_vectors.dart';
import '../bloc/pass_visibility_state.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ButtonCubit(),
        ),
        BlocProvider(
          create: (context) => PassVisibilityCubit(),
        ),
        BlocProvider(
          create: (context) => CheckBoxCubit(),
        ),
      ],
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonLoaded) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutesName.navigationBar, (route) => false);
          }
          if (state is FailureButtonLoad) {
            var snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,

          /// AppBar
          appBar: _appBar(),
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                /// Curved Edge of LoginScreen
                FractionallySizedBox(
                  alignment: Alignment.topCenter,
                  heightFactor: 0.1,
                  child: ClipPath(
                    clipper: CustomCurvedEdge(),
                    child: Container(
                      color: AppColor.primaryColor,
                    ),
                  ),
                ),

                /// Login Form
                FractionallySizedBox(
                  alignment: Alignment.bottomCenter,
                  heightFactor: 0.8,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.5 * AppSizeConfigs.widthMultiplier),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 2.1 * AppSizeConfigs.heightMultiplier,
                              ),

                              /// Login header
                              _loginHeader(context),
                              SizedBox(
                                height: 5.4 * AppSizeConfigs.heightMultiplier,
                              ),

                              /// Email header
                              _emailHeader(context),

                              SizedBox(
                                height: 0.5 * AppSizeConfigs.heightMultiplier,
                              ),

                              /// Email Field
                              _emailField(),

                              SizedBox(
                                height: 2.1 * AppSizeConfigs.heightMultiplier,
                              ),

                              /// Password header
                              _passwordHeader(context),
                              SizedBox(
                                height: 0.5 * AppSizeConfigs.heightMultiplier,
                              ),

                              /// Password Field
                              _passwordField(),
                              SizedBox(
                                height: 1.5 * AppSizeConfigs.heightMultiplier,
                              ),

                              /// Remember me and Forgot Password
                              _rememberAndForgotPass(context),
                              SizedBox(
                                height: 4 * AppSizeConfigs.heightMultiplier,
                              ),

                              /// Login Button
                              _loginButton(),
                              SizedBox(
                                height: 4.3 * AppSizeConfigs.heightMultiplier,
                              ),

                              /// Dont't have an account and signup
                              _textSpan(context),

                              SizedBox(
                                height: 4.3 * AppSizeConfigs.heightMultiplier,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _appBar() {
    return CustomeAppbar(
      backgroundColor: AppColor.primaryColor,
      title: Center(
        child: SvgPicture.asset(
          width: 93 * AppSizeConfigs.widthMultiplier,
          height: 4.5 * AppSizeConfigs.heightMultiplier,
          AppVectors.splashLogo,
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      showBackArrow: false,
    );
  }

  Widget _loginHeader(BuildContext context) {
    return Center(
      child: Text(
        AppString.login,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: AppColor.primaryColor),
      ),
    );
  }

  Widget _emailHeader(BuildContext context) {
    return Text(
      AppString.email,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColor.primaryColor,
          ),
    );
  }

  Widget _emailField() {
    return CustomTextField(
      controller: _emailCon,
      hintText: AppString.enterEmail,
      prefixIcon: Icons.mail,
      secondaryIcon: Icons.verified,
      validator: AppValidators.validateEmail,
    );
  }

  Widget _passwordHeader(BuildContext context) {
    return Text(
      AppString.password,
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColor.primaryColor),
    );
  }

  Widget _passwordField() {
    return BlocBuilder<PassVisibilityCubit, PassVisibilityState>(
      builder: (context, state) {
        return CustomTextField(
          controller: _passCon,
          hintText: AppString.enterPassword,
          prefixIcon: Icons.lock,
          primaryIcon: Icons.remove_red_eye,
          secondaryIcon: Icons.visibility_off,
          obscureText: state.obscuredTextChange,
          onPressed: () => context
              .read<PassVisibilityCubit>()
              .onClicked(state.obscuredTextChange),
          validator: AppValidators.validatePassword,
        );
      },
    );
  }

  Widget _rememberAndForgotPass(BuildContext context) {
    return Row(
      children: [
        BlocBuilder<CheckBoxCubit, CheckBoxState>(
          builder: (context, state) {
            if (state is CheckBoxInitial) {
              return Checkbox(
                  value: state.value,
                  onChanged: (value) {
                    context.read<CheckBoxCubit>().checkBox(state.value);
                  });
            }
            if (state is CheckBoxClicked) {
              return Checkbox(
                  value: state.value,
                  onChanged: (value) {
                    context.read<CheckBoxCubit>().checkBox(state.value);
                  });
            }
            return Checkbox.adaptive(value: false, onChanged: (value) {});
          },
        ),
        Text(
          AppString.rememberMe,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColor.primaryColor),
        ),
        const Spacer(),
        Text(
          AppString.forgetPass,
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColor.primaryColor),
        ),
      ],
    );
  }

  Widget _loginButton() {
    return Builder(builder: (context) {
      return SizedBox(
        width: double.infinity,
        child: ReactiveElevatedButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              context.read<ButtonCubit>().execute(
                    usecase: sl<LoginUsecase>(),
                    params: SigninReqParams(
                      email: _emailCon.text,
                      password: _passCon.text,
                    ),
                  );
            }
          },
          label: AppString.login,
        ),
      );
    });
  }

  Widget _textSpan(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: AppString.dontHaveAnAccount,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColor.primaryColor),
            ),
            TextSpan(
                text: AppString.signUp,
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColor.primaryColor,
                      fontWeight: FontWeight.w700,
                    ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pushNamed(context, AppRoutesName.signupScreen);
                  }),
          ],
        ),
      ),
    );
  }
}
