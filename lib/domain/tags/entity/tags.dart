class TagsEntity {
    TagsEntity({
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
}