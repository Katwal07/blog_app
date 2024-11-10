class UserDetailsModel {
    UserDetailsModel({
        required this.id,
        required this.name,
        required this.email,
        required this.emailVerifiedAt,
        required this.currentTeamId,
        required this.profilePhotoPath,
        required this.about,
        required this.createdAt,
        required this.updatedAt,
        required this.profilePhotoUrl,
    });

    final int? id;
    final String? name;
    final String? email;
    final dynamic emailVerifiedAt;
    final dynamic currentTeamId;
    final dynamic profilePhotoPath;
    final dynamic about;
    final DateTime? createdAt;
    final DateTime? updatedAt;
    final String? profilePhotoUrl;

    factory UserDetailsModel.fromJson(Map<String, dynamic> json){ 
        return UserDetailsModel(
            id: json["id"],
            name: json["name"],
            email: json["email"],
            emailVerifiedAt: json["email_verified_at"],
            currentTeamId: json["current_team_id"],
            profilePhotoPath: json["profile_photo_path"],
            about: json["about"],
            createdAt: DateTime.tryParse(json["created_at"] ?? ""),
            updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
            profilePhotoUrl: json["profile_photo_url"],
        );
    }

}
