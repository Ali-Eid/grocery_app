import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/core/error/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, String>> signInPhoneNumber(String phoneNumber);
  Future<Either<Failure, UserCredential>> otpVerfy(
      String verfyId, String otpNum);
  Future<Either<Failure, UserCredential>> SignInbyGoogle();
}
