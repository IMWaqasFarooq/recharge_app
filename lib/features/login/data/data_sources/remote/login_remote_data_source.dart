import 'package:dartz/dartz.dart';

import '../../models/error_model.dart';
import '../../models/user_model.dart';

abstract class LoginRemoteDataSource {

  Future<Either<ErrorModel, UserModel>> getUserData({required bool isVerified});
}
