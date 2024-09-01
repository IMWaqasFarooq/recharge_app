import 'package:dartz/dartz.dart';

import '../../data/models/error_model.dart';
import '../entity/user_entity.dart';

abstract class LoginRepository {

  Future<Either<ErrorModel, UserEntity>> loginUser(
  {
    required bool isVerified
  });


}
