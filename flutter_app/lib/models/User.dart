class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String role;
  final String? sex;  
  final String profilePhotoUrl;
  final String? coverPhotoUrl;
  final String? phone;

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.role,
    this.sex,
    required this.profilePhotoUrl,
    this.coverPhotoUrl,
    this.phone,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      role: json['role'] ?? '',
      sex: json['sex'] ?? '',
      profilePhotoUrl: json['profilePhotoUrl'] ?? '',
      coverPhotoUrl: json['coverPhotoUrl'] ?? '',
      phone: json['phone'] ?? '',
    );
  }
}
