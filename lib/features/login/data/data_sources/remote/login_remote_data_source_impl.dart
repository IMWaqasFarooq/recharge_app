import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:recharge_app/core/constants/error_constants.dart';


import '../../models/error_model.dart';
import '../../models/user_model.dart';
import 'login_remote_data_source.dart';

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final Dio dio;

  LoginRemoteDataSourceImpl({required this.dio});

  @override
  Future<Either<ErrorModel, UserModel>> getUserData({required bool isVerified}) async {
    try {

      Response<dynamic> response;
      if(isVerified){
        response = await dio.get('/verified_user');

      }else{
        response = await dio.get('/non_verified_user');

      }

      if (response.data != null) {
        UserModel userModel = UserModel.fromJson(response.data);
        return Right(userModel);
      } else {
        return Left(ErrorModel(status: 'Failed', message: ErrorsConstants.noRecord));
      }
    } on DioException catch (e) {
      print(e.toString());
      return Left(ErrorModel(status: 'Failed', message: ErrorsConstants.somethingWrong));
    }
  }
}
