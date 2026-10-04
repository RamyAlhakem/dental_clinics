import 'package:dental_clinics_app/core/features/auth/domain/entities/user_entitie.dart';

class UserModel extends UserEntitie {
  final String password;
  final String newPassword;
  const UserModel({
    super.email,
    super.name,
    super.phone,
    super.id,
    super.docId,
    this.password = "",
    this.newPassword = "",
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      docId: json['docId'] as String,
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String? ?? "",
      newPassword: json['newPassword'] as String? ?? "",
    );
  }
  UserModel copyWith({
    String? id,
    String? docId,
    String? email,
    String? name,
    String? phone,
    String? password,
    String? newPassword,
  }) {
    return UserModel(
      docId: docId ?? this.docId,
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      password: password ?? this.password,
      newPassword: newPassword ?? this.newPassword,
      phone: phone ?? this.phone,
    );
  }

  /// Converts this UserModel instance into a JSON map
  Map<String, dynamic> toJson() {
    return {
      'docId': docId,
      'id': id,
      'email': email,
      'name': name,
      'phone': phone,
      'password': password,
      'newPassword': newPassword,
    };
  }
}
