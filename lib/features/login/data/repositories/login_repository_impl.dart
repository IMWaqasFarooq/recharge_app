
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recharge_app/features/login/data/models/user_model.dart';
import '../../../../core/constants/error_constants.dart';
import '../../../../core/services/secure_storage.dart';
import '../../domain/entity/user_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/remote/login_remote_data_source.dart';
import '../models/error_model.dart';

class LoginRepositoryImpl extends LoginRepository {
  LoginRemoteDataSource loginRemoteDataSource;
  InternetConnectionChecker connection;
	LoginRepositoryImpl({required this.loginRemoteDataSource, required this.connection});

  @override
  Future<Either<ErrorModel, UserEntity>> loginUser(
      {required bool isVerified}) async {
    // TODO: implement getTransactionList

    if(await connection.hasConnection){

      try{
        final result = await loginRemoteDataSource.getUserData(isVerified: isVerified);

        return result.fold((error) {
          return Left(error);
        }, (userModel) async {
          UserEntity user = userModel.toUser;

          await SecureStorage().storeUserData(user: userModel);

          return Right(user);
        });

      }catch (e){

        debugPrint(e.toString());
        return Left( ErrorModel(
            status: "error",
            message: ErrorsConstants.somethingWrong
        )
        );
      }

    }else{
      return Left( ErrorModel(
          status: "error",
          message: ErrorsConstants.networkError
      )
      );
    }


  }

}
