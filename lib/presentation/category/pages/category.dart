import 'package:blog_app/presentation/category/widgets/category_list.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              _categoryText(context),
              const SizedBox(
                height: 10,
              ),
              const CategoryList()
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryText(BuildContext context) {
    return Text(
      'Categories',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }

  
}
