// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:blog_app/common/bloc/button/button_cubit.dart';
import 'package:blog_app/common/bloc/button/button_state.dart';
import 'package:blog_app/data/post/model/add_post.dart';
import 'package:blog_app/domain/post/usecase/add_post_usecase.dart';
import 'package:blog_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class AddPostListView extends StatefulWidget {
  const AddPostListView({super.key});

  @override
  State<AddPostListView> createState() => _AddPostListViewState();
}

class _AddPostListViewState extends State<AddPostListView> {
  File? image;
  final ImagePicker _picker = ImagePicker();

  Future<void> getImage() async {
    final pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    } else {
      debugPrint("No Image Selected");
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ButtonCubit(),
      child: BlocListener<ButtonCubit, ButtonState>(
        listener: (context, state) {
           if (state is ButtonLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Post created successfully')));
         
            setState(() {
              image = null;
            });
          } else if (state is ButtonLoading) {
            // Show loading indicator
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Creating post...')));
          } else if (state is FailureButtonLoad) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
                },
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              _uploadProfileImage(),
               Builder(
                 builder: (context) {
                   return ElevatedButton(
                    onPressed: () {
                      context.read<ButtonCubit>().execute(
                        usecase: sl<AddPostUsecase>(),
                        params: AddPostModel(
                          title: "Rohan",
                          slug: "rohan",
                          categories: "185",
                          tags: "571",
                          body: "Rohan Katwal is a hero",
                          featuredimage: image,
                          userId: 164,
                        ),
                      );
                    },
                    child: const Text("ADD"),
                                 );
                 }
               )
            ],
          ),
        )),
      ),
    );
  }

  Widget _uploadProfileImage() {
    return Row(
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(14),
              bottomLeft: Radius.circular(14),
            ),
          ),
          child: IconButton(
            onPressed: (){
               getImage();
            },
            icon: image == null
                ? const Icon(Icons.person_2_rounded)
                : const Icon(Icons.percent_sharp),
          ),
        ),
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(14),
              bottomRight: Radius.circular(14),
            ),
          ),
          child: const Center(
            child: Text("data"),
          ),
        ),
      ],
    );
  }
}
