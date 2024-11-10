import 'package:flutter/material.dart';
import '../../../core/configs/theme/colors.dart';

class HeadingBar extends StatelessWidget {
  const HeadingBar({
    super.key,
    required this.title,
     this.icon,
    this.onPressed,
  });
  final String title;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: AppColor.primaryColor),
        ),
        const Spacer(),
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon),
          iconSize: 32,
          color: AppColor.primaryColor,
        )
      ],
    );
  }
}
