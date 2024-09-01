
import 'package:dio/dio.dart';

import 'recharge_remote_data_source.dart';

class RechargeRemoteDataSourceImpl extends RechargeRemoteDataSource {
  final Dio dio;

  RechargeRemoteDataSourceImpl({required this.dio});

}
