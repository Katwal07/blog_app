import 'package:flutter/material.dart';

import '../../res/size_configs.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.validator,
    this.onChanged,
    this.onPressed,
    this.primaryIcon,
    this.secondaryIcon,
  });

  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final String Function(String)? onChanged;
  final void Function()? onPressed;
  final IconData? primaryIcon;
  final IconData? secondaryIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        suffixIcon: IconButton(
          onPressed: onPressed,
          icon: Icon(
            obscureText ? primaryIcon : secondaryIcon,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 1.5 * AppSizeConfigs.heightMultiplier,
          horizontal: 20,
        ),
      ),
    );
  }
}
