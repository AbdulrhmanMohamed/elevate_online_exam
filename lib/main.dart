import 'package:basic_layout/data/api/api_manager.dart';
import 'package:basic_layout/di/di.dart';
import 'package:basic_layout/presentaion/helper/router_helper.dart';
import 'package:flutter/material.dart';
import 'package:basic_layout/data/datasources/init_local_datasource.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
GetIt getIt=GetIt.instance;
void main() async {

getIt.registerLazySingleton<Dio>(() => Dio()); // Register Dio
  getIt.registerLazySingleton<ApiManager>(() => ApiManager(getIt<Dio>()));
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
  configureDependencies();
  initLocalDataSource();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
              elevation: 0,
              titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black))),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: manageRoute,
      initialRoute: 'login',
    );
  }
}
