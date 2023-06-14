import 'package:firebase_auth/firebase_auth.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:grocery_app/features/auth/data/datasource/local_data_source.dart';
import 'package:grocery_app/features/auth/data/datasource/remote_data_source.dart';
import 'package:grocery_app/features/auth/domain/repositroy/auth_repository.dart';

class AuthRepositroyImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositroyImpl(this.authRemoteDataSource, this.authLocalDataSource);
  @override
  Future<Either<Failure, String>> signInPhoneNumber(String phoneNumber) async {
    try {
      final remote = await authRemoteDataSource.signInPhone(phoneNumber);
      return right(remote);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> otpVerfy(
      String verfyId, String otpNum) async {
    try {
      final remote = await authRemoteDataSource.otpVerify(verfyId, otpNum);
      await authLocalDataSource.cachedToken(remote.user!.uid);
      return right(remote);
    } catch (e) {
      return left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserCredential>> SignInbyGoogle() async {
    try {
      final remote = await authRemoteDataSource.SignInbyGoogle();
      await authLocalDataSource.cachedToken(remote.user!.uid);
      // token = await authLocalDataSource.getToken();
      return right(remote);
    } catch (e) {
      return left(ServerFailure());
    }
  }
}
