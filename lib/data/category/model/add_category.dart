class AddCategoryModel {
  final String title;
  final String slug;

  AddCategoryModel({required this.title, required this.slug});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'slug': slug,
    };
  }
}
