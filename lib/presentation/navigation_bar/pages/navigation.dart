import 'package:blog_app/presentation/post/pages/add_post.dart';
import 'package:blog_app/presentation/profile/pages/profile.dart';
import 'package:blog_app/presentation/tags/pages/tags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../category/pages/category.dart';
import '../../home/pages/home.dart';
import '../bloc/navigation_cubit.dart';
import '../bloc/navigation_state.dart';

List<BottomNavigationBarItem> bottomNavigationBarItems =
    const <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.category),
    label: 'category',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.add),
    label: 'Add',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.tag),
    label: 'Tags',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_2_outlined),
    label: 'Profile',
  ),
];

List<Widget> bottomNavScreen = const <Widget>[
  HomeScreen(),
  CategoryScreen(),
  AddPostScreen(),
  TagsScreen(),
  ProfileScreen()
];

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationCubit(),
      child: BlocBuilder<NavigationCubit, NavigationState>(
          builder: (context, state) {
        if (state is NavigationPageState) {
          return Scaffold(
            body: bottomNavScreen.elementAt(state.tabIndex),
            bottomNavigationBar: Theme(
              data: Theme.of(context).copyWith(
                canvasColor:
                    const Color(0xff242A32), // Your desired background color
              ),
              child: BottomNavigationBar(
                items: bottomNavigationBarItems,
                currentIndex: state.tabIndex,
                selectedItemColor: const Color(0xff0296E5),
                unselectedItemColor: const Color(0xff67686D),
                onTap: (index) {
                  context.read<NavigationCubit>().navigateToPage(index);
                },
              ),
            ),
          );
        }
        return Container();
      }),
    );
  }
}
