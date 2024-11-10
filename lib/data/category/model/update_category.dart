class UpdateCategoryModel {
  final String id;
  final String title;
  final String slug;

  UpdateCategoryModel({required this.id, required this.title, required this.slug,});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'slug': slug,
    };
  }
}
