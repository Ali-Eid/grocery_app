import 'package:dartz/dartz.dart';
import 'package:grocery_app/core/error/failure.dart';
import 'package:grocery_app/features/auth/domain/entity/success_entity.dart';
import 'package:grocery_app/features/auth/domain/repositroy/auth_repository.dart';

class OtpUsecase {
  final AuthRepository repository;

  OtpUsecase(this.repository);
  Future<Either<Failure, SuccessEntity>> call(String otp) async {
    return await repository.otpVerify(otp);
  }
}
