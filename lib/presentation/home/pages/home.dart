import 'package:flutter/material.dart';

import '../widgets/horizontal_category.dart';
import '../widgets/post_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              HorizontalCategory(),
              SizedBox(
                height: 20,
              ),
              GridViewPostCard(),
            ],
          ),
        ),
      )),
    );
  }
}
