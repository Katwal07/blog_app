import 'package:flutter/material.dart';

import '../../../core/configs/theme/colors.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
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
    return ElevatedButton(
      onPressed: onPressed,
       style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(color: borderColor)
      ),
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
