import 'package:blog_app/common/res/size_configs.dart';
import 'package:flutter/material.dart';

class CustomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomeAppbar({
    super.key,
    this.title,
    required this.showBackArrow,
    this.leadingIcon,
    this.action,
    this.leadingOnPressed, 
    this.backgroundColor,
  });

  final Widget? title;
  final bool showBackArrow;
  final Color? backgroundColor;
  final IconData? leadingIcon;
  final List<Widget>? action;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      automaticallyImplyLeading: false,
      leading: showBackArrow
          ? IconButton(
              onPressed: () => Navigator.pop,
              icon: const Icon(
                Icons.arrow_back_rounded,
                size: 22,
                color: Colors.white,
              ),
            )
          : leadingIcon != null
              ? IconButton(
                  onPressed: leadingOnPressed,
                  icon: Icon(leadingIcon),
                )
              : null,
      title: title,
      actions: action,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppSizeConfigs.appBarHeight );
}
