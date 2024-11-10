class AddTagsModel {
  final String title;
  final String slug;

  AddTagsModel({required this.title, required this.slug});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'slug': slug,
    };
  }
}
