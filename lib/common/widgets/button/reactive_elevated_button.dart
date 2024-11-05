import 'package:blog_app/common/bloc/button/button_cubit.dart';
import 'package:blog_app/common/bloc/button/button_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/configs/theme/colors.dart';

class ReactiveElevatedButton extends StatelessWidget {
  const ReactiveElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor = AppColor.primaryColor, this.height, this.width,
  });

  final String label;
  final IconData? icon;
  final Color? iconColor;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color borderColor;
  final double ? height;
  final double ? width;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonCubit, ButtonState>(
      builder: (context, state) {
        if (state is ButtonLoading) {
         return _loading(context);
        }
         return  _loaded(context);
        
      },
    );
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: AppColor.primaryColor1,
        side:const BorderSide(color: AppColor.primaryColor1)
      ),
      child: const CircularProgressIndicator(
        color: Colors.white,
      ),
    );
  }

  Widget _loaded(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          side: BorderSide(color: borderColor)),
      child: icon == null
          ? Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Colors.white),
            )
          : Row(
              children: [
                Text(
                  label,
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(width: 8),
                Icon(
                  icon,
                  color: iconColor,
                )
              ],
            ),
    );
  }
}
