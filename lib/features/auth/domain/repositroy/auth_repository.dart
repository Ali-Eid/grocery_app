import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/features/auth/domain/entity/success_entity.dart';
import 'package:grocery_app/features/auth/domain/entity/user_entity.dart';

abstract class AuthRepository {
  // Future<Either<Failure, String>> signInPhoneNumber(String phoneNumber);
  // Future<Either<Failure, UserCredential>> otpVerfy(
  //     String verfyId, String otpNum);
  // Future<Either<Failure, UserCredential>> SignInbyGoogle();

  Future<Either<Failure, UserEntity>> login(String mobile, String password);
  Future<Either<Failure, UserEntity>> signUp(
      String mobile, String password, String name);
  Future<Either<Failure, SuccessEntity>> otpVerify(String otp);
}
