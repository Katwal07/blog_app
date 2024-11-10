class TagsModel {
    TagsModel({
        required this.id,
        required this.title,
        required this.slug,
        required this.createdAt,
        required this.updatedAt,
    });

    final int? id;
    final String? title;
    final String? slug;
    final DateTime? createdAt;
    final DateTime? updatedAt;

    factory TagsModel.fromJson(Map<String, dynamic> json){ 
        return TagsModel(
            id: json["id"],
            title: json["title"],
            slug: json["slug"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
        );
    }

}