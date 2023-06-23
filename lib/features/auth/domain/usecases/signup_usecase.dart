import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/features/auth/domain/entity/user_entity.dart';
import 'package:grocery_app/features/auth/domain/repositroy/auth_repository.dart';

class SignUpUsecase {
  final AuthRepository repository;

  SignUpUsecase(this.repository);
  Future<Either<Failure, UserEntity>> call(
      String mobile, String password, String name) async {
    return await repository.signUp(mobile, password, name);
  }
}
