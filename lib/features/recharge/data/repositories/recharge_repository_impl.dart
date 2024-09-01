
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recharge_app/core/constants/error_constants.dart';
import 'package:recharge_app/features/login/data/models/error_model.dart';
import 'package:recharge_app/features/recharge/data/data_sources/local/recharge_local_data_source.dart';
import 'package:recharge_app/features/recharge/domain/entity/beneficiary.dart';

import '../../domain/repositories/recharge_repository.dart';
import '../data_sources/remote/recharge_remote_data_source.dart';


class RechargeRepositoryImpl extends RechargeRepository {
  RechargeRemoteDataSource rechargeRemoteDataSource;
  RechargeLocalDataSource rechargeLocalDataSource;
  InternetConnectionChecker connection;
	RechargeRepositoryImpl({
    required this.rechargeRemoteDataSource,
    required this.rechargeLocalDataSource,
    required this.connection});

  @override
  Future<Either<ErrorModel, String>> addBeneficiary({required Beneficiary beneficiary}) async {
    // TODO: implement addBeneficiary
    try{
      final beneficiaries = rechargeLocalDataSource.getBeneficiaries();

      if(beneficiaries.length>5){
        return(Left(ErrorModel(message: "you can only add max 5 beneficiaries")));
      }else{
        bool alreadyExist =beneficiaries.any((element) => element.phoneNumber == beneficiary.phoneNumber) ;

        if(alreadyExist){
          return(Left(ErrorModel(message: "Beneficiary with same phone number already exist")));
        }else{
          await rechargeLocalDataSource.addBeneficiary(beneficiary: beneficiary);
          return const Right("Beneficiary added successfully");
        }

      }


    }catch(e){
      return(Left(ErrorModel(message: ErrorsConstants.somethingWrong)));
    }
  }

  @override
  Either<ErrorModel, List<Beneficiary>> getBeneficiaries() {
    // TODO: implement getBeneficiaries

    try{
      final list = rechargeLocalDataSource.getBeneficiaries();

      return Right(list);
    } catch(e){

      return(Left(ErrorModel(message: ErrorsConstants.somethingWrong)));
    }


  }


}
