class UserModel {
  final int id;
  final String name;
  final String email;
  final int approved;

  // Google fields
  final String? googleId;
  final String? photo;
  final String? provider;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.approved,
    this.googleId,
    this.photo,
    this.provider,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: int.parse(json['id'].toString()),
      name: json['name'] ?? "",
      email: json['email'] ?? "",
      approved: int.parse(json['approved'].toString()),
      googleId: json['google_id']?.toString(),
      photo: json['photo']?.toString(),
      provider: json['provider']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "email": email,
      "approved": approved,
      "google_id": googleId,
      "photo": photo,
      "provider": provider,
    };
  }
}
