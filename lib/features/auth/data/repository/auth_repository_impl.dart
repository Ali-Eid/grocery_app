import 'package:grocery_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/global/constants.dart';
import 'package:grocery_app/features/auth/data/datasource/local_data_source.dart';
import 'package:grocery_app/features/auth/data/datasource/remote_data_source.dart';
import 'package:grocery_app/features/auth/domain/entity/success_entity.dart';
import 'package:grocery_app/features/auth/domain/entity/user_entity.dart';
import 'package:grocery_app/features/auth/domain/repositroy/auth_repository.dart';
import 'package:grocery_app/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepositroyImpl implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  final AuthLocalDataSource authLocalDataSource;

  AuthRepositroyImpl(this.authRemoteDataSource, this.authLocalDataSource);

  @override
  Future<Either<Failure, UserEntity>> login(
      String mobile, String password) async {
    try {
      final remote = await authRemoteDataSource.login(mobile, password);
      // await authLocalDataSource.cachedToken(remote.token);

      await sl<SharedPreferences>().setString('token', remote.token);
      return Right(remote);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signUp(
      String mobile, String password, String name) async {
    try {
      final remote = await authRemoteDataSource.signUp(mobile, password, name);
      // await authLocalDataSource.cachedToken(remote.token);
      await sl<SharedPreferences>().setString('token', remote.token);
      token = await authLocalDataSource.getToken();
      return Right(remote);
    } catch (e) {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, SuccessEntity>> otpVerify(String otp) async {
    try {
      final remote = await authRemoteDataSource.otpVerfiy(otp);

      return Right(remote);
    } catch (e) {
      return Left(ServerFailure());
    }
  }
  // @override
  // Future<Either<Failure, String>> signInPhoneNumber(String phoneNumber) async {
  //   try {
  //     final remote = await authRemoteDataSource.signInPhone(phoneNumber);
  //     return right(remote);
  //   } catch (e) {
  //     return left(ServerFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, UserCredential>> otpVerfy(
  //     String verfyId, String otpNum) async {
  //   try {
  //     final remote = await authRemoteDataSource.otpVerify(verfyId, otpNum);
  //     await authLocalDataSource.cachedToken(remote.user!.uid);
  //     return right(remote);
  //   } catch (e) {
  //     return left(ServerFailure());
  //   }
  // }

  // @override
  // Future<Either<Failure, UserCredential>> SignInbyGoogle() async {
  //   try {
  //     final remote = await authRemoteDataSource.SignInbyGoogle();
  //     await authLocalDataSource.cachedToken(remote.user!.uid);
  //     // token = await authLocalDataSource.getToken();
  //     return right(remote);
  //   } catch (e) {
  //     return left(ServerFailure());
  //   }
  // }
}
