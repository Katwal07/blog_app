import 'package:blog_app/common/bloc/generic_data_cubit.dart';
import 'package:blog_app/common/validators/validators.dart';
import 'package:blog_app/common/widgets/app_bar/app_bar.dart';
import 'package:blog_app/common/widgets/button/reactive_elevated_button.dart';
import 'package:blog_app/common/widgets/container/curve_edge.dart';
import 'package:blog_app/common/widgets/textfield/text_field.dart';
import 'package:blog_app/core/configs/routes/routes_name.dart';
import 'package:blog_app/core/configs/theme/colors.dart';
import 'package:blog_app/data/auth/model/signin_req_params.dart';
import 'package:blog_app/domain/auth/usecases/login_usecase.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common/bloc/generic_data_state.dart';
import '../../../../common/res/size_configs.dart';
import '../../../../core/configs/assets/app_vectors.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  final formKey = GlobalKey<FormState>();
  

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GenericDataCubit(),
      child: BlocListener<GenericDataCubit, GenericDataState>(
        listener: (context, state) {
          if (state is DataLoaded) {
            Navigator.pushReplacementNamed(context, AppRoutesName.homeScreen);
          }
          if (state is FailureLoadData) {
            var snackBar = SnackBar(content: Text(state.errorMessage));
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: _appBar(),
          body: SafeArea(
            child: Stack(
              fit: StackFit.expand,
              children: [
                ClipPath(
                  clipper: CustomCurvedEdge(),
                  child: FractionallySizedBox(
                    alignment: Alignment.topCenter,
                    heightFactor: 0.1,
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
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Form(
                          key: formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),

                              /// Login header
                              _loginHeader(context),
                              const SizedBox(
                                height: 50,
                              ),

                              /// Email header
                              _emailHeader(context),
                              const SizedBox(
                                height: 10,
                              ),

                              /// Email Field
                              _emailField(),
                              const SizedBox(
                                height: 20,
                              ),

                              /// Password header
                              _passwordHeader(context),
                              const SizedBox(
                                height: 10,
                              ),

                              /// Password Field
                              _passwordField(),
                              const SizedBox(
                                height: 20,
                              ),

                              /// Remember me and Forgot Password
                              _rememberAndForgotPass(context),
                              const SizedBox(
                                height: 20,
                              ),

                              /// Login Button
                              _loginButton(),
                              const SizedBox(
                                height: 40,
                              ),

                              /// Dont't have an account and signup
                              _textSpan(context),

                              const SizedBox(
                                height: 40,
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
        "Login",
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: AppColor.primaryColor),
      ),
    );
  }

  Widget _emailHeader(BuildContext context) {
    return Text(
      "Email",
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: AppColor.primaryColor,
          ),
    );
  }

  Widget _emailField() {
    return CustomTextField(
      controller: _emailCon,
      hintText: "Enter E-mail",
      prefixIcon: Icons.mail,
      suffixIcon: Icons.verified_user,
      validator: AppValidators.validateEmail,
    );
  }

  Widget _passwordHeader(BuildContext context) {
    return Text(
      "Password",
      style: Theme.of(context)
          .textTheme
          .bodyLarge!
          .copyWith(color: AppColor.primaryColor),
    );
  }

  Widget _passwordField() {
    return CustomTextField(
      controller: _passCon,
      hintText: "Enter Password",
      prefixIcon: Icons.lock,
      suffixIcon: Icons.remove_red_eye,
      validator: AppValidators.validatePassword,
    );
  }

  Widget _rememberAndForgotPass(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: false, onChanged: (value) {}),
        Text(
          "Remember me",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColor.primaryColor),
        ),
        const Spacer(),
        Text(
          "Forgot Password",
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
           if(formKey.currentState!.validate()){
             context.read<GenericDataCubit>().getData(
                  sl<LoginUsecase>(),
                  params: SigninReqParams(
                    email: _emailCon.text,
                    password: _passCon.text,
                  ),
                );
           }
          },
          label: "Login",
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
              text: "Don't have an account ",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColor.primaryColor),
            ),
            TextSpan(
                text: "Sign Up",
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
