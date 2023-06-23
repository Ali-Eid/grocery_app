import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final int id;
  final String name;
  final String mobile;
  final String code;
  final String token;

  const UserEntity({
    required this.id,
    required this.name,
    required this.mobile,
    required this.code,
    required this.token,
  });

  @override
  List<Object?> get props => [id, name, mobile, code, token];
}
