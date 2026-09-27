import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';

class UserModel extends UserEntitie {
  final String password;
  final String newPassword;
  const UserModel({
    super.email,
    super.name,
    super.phone,
    this.password = "",
    this.newPassword = "",
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String? ?? "",
      newPassword: json['newPassword'] as String? ?? "",
    );
  }

  /// Converts this UserModel instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'password': password,
      'newPassword': newPassword,
    };
  }
}
