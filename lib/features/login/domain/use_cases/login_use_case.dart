
import 'package:dartz/dartz.dart';


import '../../data/models/error_model.dart';
import '../entity/user_entity.dart';
import '../repositories/login_repository.dart';

class LoginUseCase {
  final LoginRepository loginRepository;

  LoginUseCase({required this.loginRepository});

  Future<Either<ErrorModel, UserEntity>> execute({
    required bool isVerified}) {
    return loginRepository.loginUser(
        isVerified: isVerified
    );
  }


}