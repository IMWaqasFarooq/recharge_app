import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:recharge_app/features/recharge/data/data_sources/local/recharge_local_data_source.dart';
import 'package:recharge_app/features/recharge/data/data_sources/remote/recharge_remote_data_source.dart';
import 'package:recharge_app/features/recharge/domain/use_cases/add_beneficiary_use_case.dart';
import 'package:recharge_app/features/recharge/domain/use_cases/get_beneficiaries_use_case.dart';
import 'package:recharge_app/features/recharge/domain/use_cases/recharge_history_use_case.dart';
import 'package:recharge_app/features/recharge/presentation/ui/home/tabs/history/bloc/history_bloc.dart';
import 'package:recharge_app/features/recharge/presentation/ui/top_up/bloc/top_up_bloc.dart';

import '../../features/login/data/data_sources/remote/login_remote_data_source.dart';
import '../../features/login/data/data_sources/remote/login_remote_data_source_impl.dart';
import '../../features/login/data/repositories/login_repository_impl.dart';
import '../../features/login/domain/repositories/login_repository.dart';
import '../../features/login/domain/use_cases/login_use_case.dart';
import '../../features/login/presentation/bloc/login_bloc.dart';
import '../../features/login/data/data_sources/remote/mock_interceptor.dart';
import '../../features/recharge/data/data_sources/local/recharge_local_data_source_impl.dart';
import '../../features/recharge/data/data_sources/remote/recharge_remote_data_source_impl.dart';
import '../../features/recharge/data/repositories/recharge_repository_impl.dart';
import '../../features/recharge/domain/repositories/recharge_repository.dart';
import '../../features/recharge/domain/use_cases/recharge_use_case.dart';
import '../../features/recharge/presentation/ui/home/tabs/recharge/bloc/recharge_bloc.dart';



final sl = GetIt.instance;


Future<void> init() async {
  //!External

  /// Adding the [Dio] instance to the graph to be later used by the local data sources
  sl.registerLazySingleton(
    () {
      final dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(minutes: 5),
          sendTimeout: const Duration(minutes: 5),
          baseUrl: '',
          headers: {},
          responseType: ResponseType.plain,
        ),
      );
      dio.interceptors.add(
        LogInterceptor(
            responseBody: true,
            requestBody: true,
            responseHeader: true,
            requestHeader: true,
            request: true,
            error: true),
      );

      dio.interceptors.add(MockInterceptor());

      return dio;
    },
  );

  sl.registerLazySingleton(() => InternetConnectionChecker());


  ///Login

  // // DataSources
  sl.registerLazySingleton<LoginRemoteDataSource>(
      () => LoginRemoteDataSourceImpl(dio: sl()));
  // Repositories
  sl.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImpl(loginRemoteDataSource: sl(), connection: sl()));
  // Domain
  // Use cases
  sl.registerLazySingleton(() => LoginUseCase(loginRepository: sl()));

  // Presentation
  // BLoC
  sl.registerFactory(() => LoginBloc(loginUseCase: sl()));

  ///Recharge

  // // DataSources
  sl.registerLazySingleton<RechargeRemoteDataSource>(
          () => RechargeRemoteDataSourceImpl(dio: sl()));

  sl.registerLazySingleton<RechargeLocalDataSource>(
          () => RechargeLocalDataSourceImpl());

  // Repositories
  sl.registerLazySingleton<RechargeRepository>(
          () => RechargeRepositoryImpl(
              rechargeRemoteDataSource: sl(),
              rechargeLocalDataSource: sl(),
              connection: sl()));
  // Domain
  // Use cases
  sl.registerLazySingleton(() => RechargeUseCase(rechargeRepository: sl()));
  sl.registerLazySingleton(() => AddBeneficiaryUseCase(rechargeRepository: sl()));
  sl.registerLazySingleton(() => GetBeneficiariesUseCase(rechargeRepository: sl()));
  sl.registerLazySingleton(() => RechargeHistoryUseCase(rechargeRepository: sl()));



  // Presentation
  // BLoC
  sl.registerFactory(() => RechargeBloc(
      getBeneficiariesUseCase:sl(),
      addBeneficiaryUseCase: sl(),
  ));

  sl.registerFactory(() => TopUpBloc(
    rechargeUseCase: sl(),
  ));

  sl.registerFactory(() => HistoryBloc(
    rechargeHistoryUseCase: sl(),
  ));

}
