class PostModel {
    PostModel({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.currentTeamId,
        required this.profilePhotoPath,
        required this.about,
        required this.createdAt,
        required this.updatedAt,
        required this.userId,
        required this.title,
        required this.slug,
        required this.featuredimage,
        required this.body,
        required this.status,
        required this.like,
        required this.dislike,
        required this.views,
        required this.profilePhotoUrl,
    });

    final int? id;
    final String? name;
    final String? email;
    final dynamic emailVerifiedAt;
    final dynamic currentTeamId;
    final String? profilePhotoPath;
    final String? about;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final int? userId;
    final String? title;
    final String? slug;
    final String? featuredimage;
    final String? body;
    final int? status;
    final dynamic like;
    final dynamic dislike;
    final int? views;
    final String? profilePhotoUrl;

    factory PostModel.fromJson(Map<String, dynamic> json){ 
        return PostModel(
            id: json["id"],
            name: json["name"],
            email: json["email"],
            emailVerifiedAt: json["email_verified_at"],
            currentTeamId: json["current_team_id"],
            profilePhotoPath: json["profile_photo_path"],
            about: json["about"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            userId: json["user_id"],
            title: json["title"],
            slug: json["slug"],
            featuredimage: json["featuredimage"],
            body: json["body"],
            status: json["status"],
            like: json["like"],
            dislike: json["dislike"],
            views: json["views"],
            profilePhotoUrl: json["profile_photo_url"],
        );
    }

}
