import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/features/auth/domain/repositroy/auth_repository.dart';

class OTPVerfyUsecase {
  final AuthRepository repository;

  OTPVerfyUsecase(this.repository);
  Future<Either<Failure, UserCredential>> call(
      String verfyId, String otpNum) async {
    return await repository.otpVerfy(verfyId, otpNum);
  }
}
