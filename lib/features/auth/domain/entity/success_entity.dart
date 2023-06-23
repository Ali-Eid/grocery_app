import 'package:equatable/equatable.dart';

class SuccessEntity extends Equatable {
  final String? message;
  final String? code;

  const SuccessEntity({required this.message, required this.code});

  @override
  List<Object?> get props => [message, code];
}
