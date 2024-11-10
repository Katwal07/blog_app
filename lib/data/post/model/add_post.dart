import 'dart:io';

class AddPostModel {
  final String title;
  final String slug;
  final String categories;
  final String tags;
  final String body;
  final String status;
  final File featuredimage;
  final int userId;

  AddPostModel({
    required this.title,
    required this.slug,
    required this.categories,
    required this.tags,
    required this.body,
    this.status = "1",
    required this.featuredimage,
    required this.userId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'slug': slug,
      'categories': categories,
      'tags': tags,
      'body': body,
      'status': status,
      'featuredImage': featuredimage,
      'userId': userId,
    };
  }
}
