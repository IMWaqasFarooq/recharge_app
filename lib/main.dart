import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recharge_app/features/login/presentation/ui/login_page.dart';
import 'package:recharge_app/features/recharge/presentation/ui/recharge_page.dart';

import 'core/services/hive/hive_service.dart';
import 'core/services/secure_storage.dart';

import 'core/di/dependency_injection.dart' as di;


Future<void> main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await di.init();

  final appState = SecureStorage();

  await HiveService().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
    minTextAdapt: true,
    splitScreenMode: true,
    builder: (context, child) {
    return MaterialApp(
      title: 'Recharge App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SecureStorage().userID ==0? LoginPage():RechargePage(),
    );
    });
  }
}
