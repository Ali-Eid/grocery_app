import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/features/auth/domain/repositroy/auth_repository.dart';

class SignInbyGoogleUsecase {
  final AuthRepository repository;

  SignInbyGoogleUsecase(this.repository);
  Future<Either<Failure, UserCredential>> call() async {
    return await repository.SignInbyGoogle();
  }
}
