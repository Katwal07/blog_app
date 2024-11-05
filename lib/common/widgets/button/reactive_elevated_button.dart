import 'package:blog_app/common/bloc/generic_data_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/configs/theme/colors.dart';
import '../../bloc/generic_data_state.dart';

class ReactiveElevatedButton extends StatelessWidget {
  const ReactiveElevatedButton({
    super.key,
    required this.onPressed,
    required this.label,
    this.icon,
    this.iconColor,
    this.backgroundColor,
    this.foregroundColor,
    this.borderColor = AppColor.primaryColor,
  });

  final String label;
  final IconData? icon;
  final Color? iconColor;
  final void Function() onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenericDataCubit, GenericDataState>(
      builder: (context, state) {
        if (state is DataLoading) {
          _loading(context);
        }
        return _loaded(context);
      },
    );
  }

  Widget _loading(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        style: ElevatedButton.styleFrom(
          disabledBackgroundColor: Colors.grey,
        ),
        child: const CircularProgressIndicator(
          color: Colors.white,
        ));
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
