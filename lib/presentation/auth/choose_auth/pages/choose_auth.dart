import 'package:blog_app/core/configs/assets/app_images.dart';
import 'package:flutter/material.dart';
import '../widgets/choose_auth.dart';

class ChooseAuthScreen extends StatelessWidget {
  const ChooseAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.authBackground),
        ),
      ),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
        child: ChooseAuth()),
      ),
    );
  }
}