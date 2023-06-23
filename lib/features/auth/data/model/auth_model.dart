import 'package:grocery_app/features/auth/domain/entity/success_entity.dart';
import 'package:grocery_app/features/auth/domain/entity/user_entity.dart';

class AuthModel extends UserEntity {
  final String? message;

  const AuthModel(
    this.message, {
    required super.id,
    required super.name,
    required super.mobile,
    required super.code,
    required super.token,
  });
  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      json['message'],
      id: json['data']['user']['id'],
      name: json['data']['user']['name'],
      mobile: json['data']['user']['mobile'],
      code: json['code'],
      token: json['data']['token'],
    );
  }
}

class VerifyModel extends SuccessEntity {
  const VerifyModel({required super.message, required super.code});
  factory VerifyModel.fromJson(Map<String, dynamic> json) {
    return VerifyModel(message: json['message'], code: json['code']);
  }
}
