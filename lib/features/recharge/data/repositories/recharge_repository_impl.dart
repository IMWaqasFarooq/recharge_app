
import 'package:dartz/dartz.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recharge_app/core/constants/error_constants.dart';
import 'package:recharge_app/core/services/secure_storage.dart';
import 'package:recharge_app/features/login/data/models/error_model.dart';
import 'package:recharge_app/features/recharge/data/data_sources/local/recharge_local_data_source.dart';
import 'package:recharge_app/features/recharge/data/model/benificiary/beneficiary_model.dart';
import 'package:recharge_app/features/recharge/data/model/recharge/recharge_model.dart';

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
  Future<Either<ErrorModel, String>> addBeneficiary({required BeneficiaryModel beneficiary}) async {
    // TODO: implement addBeneficiary
    try{
      final beneficiaries = rechargeLocalDataSource.getBeneficiaries();

      if(beneficiaries.length>=5){
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
  Either<ErrorModel, List<BeneficiaryModel>> getBeneficiaries() {
    // TODO: implement getBeneficiaries

    try{
      final list = rechargeLocalDataSource.getBeneficiaries();

      return Right(list);
    } catch(e){

      return(Left(ErrorModel(message: ErrorsConstants.somethingWrong)));
    }


  }

  @override
  Future<Either<ErrorModel, String>> topUpBeneficiary({required BeneficiaryModel beneficiary, required int amount}) async {
    try {
      final userBalance = SecureStorage().balance ;
      final isVerified = SecureStorage().isVerified ;

      if (amount + 1 > userBalance) {
        return Left(ErrorModel(message: "Insufficient balance."));
      }


      final now = DateTime.now();
      String currentRechargeDate = "${now.year.toString().padLeft(4, '0')}${now.month.toString().padLeft(2, '0')}";

      if (beneficiary.lastRechargeDate != currentRechargeDate) {
        beneficiary.totalRechargeThisMonth = 0;
        beneficiary.lastRechargeDate = currentRechargeDate;
        beneficiary.save();
      }

      final beneficiaries = rechargeLocalDataSource.getBeneficiaries();
      int totalRechargeForAllBeneficiaries = beneficiaries
          .where((ben) => ben.lastRechargeDate == currentRechargeDate)
          .fold(0, (prev, ben) => prev + ben.totalRechargeThisMonth);

      if (!isVerified && amount + beneficiary.totalRechargeThisMonth > 1000) {
        return Left(ErrorModel(message: "Unverified user cannot top up more than AED 1000 per month per beneficiary."));
      }

      if (isVerified && amount + beneficiary.totalRechargeThisMonth > 500) {
        return Left(ErrorModel(message: "Verified user cannot top up more than AED 500 per month per beneficiary."));
      }

      if (totalRechargeForAllBeneficiaries + amount > 3000) {
        return Left(ErrorModel(message: "User cannot top up more than AED 3000 per month for all beneficiaries."));
      }


      // Deduct balance
      SecureStorage().balance =  userBalance - (amount + 1);

      // Update beneficiary details
      beneficiary.totalRechargeThisMonth += amount;
      await beneficiary.save();

      // Save transaction history
      final recharge = RechargeModel(
        beneficiary: beneficiary,
        amount: amount,
        date: now,
      );
      await rechargeLocalDataSource.addRechargeHistory(rechargeHistory: recharge);

      return const Right("Top-up successful.");
    } catch (e) {
      print(e.toString());
      return Left(ErrorModel(message: ErrorsConstants.somethingWrong));
    }
  }


  @override
  Either<ErrorModel, List<RechargeModel>> getRechargeHistory() {
    // TODO: implement getBeneficiaries

    try{
      final list = rechargeLocalDataSource.getRechargeHistory();

      return Right(list);
    } catch(e){

      return(Left(ErrorModel(message: ErrorsConstants.somethingWrong)));
    }


  }
}
