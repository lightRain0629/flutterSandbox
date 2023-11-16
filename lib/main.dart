// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tests/justPage.dart';
import 'package:flutter_bloc_tests/logic/cubit/settings_cubit.dart';
import 'package:flutter_bloc_tests/testCamQr.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc_tests/logic/cubit/cubitInternet/internet_cubit.dart';
import 'package:flutter_bloc_tests/presentation/colors/colorSchemes.dart';
import 'package:flutter_bloc_tests/presentation/routes/appRoutes.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'logic/cubit/couter_cubit_cubit.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await  getApplicationDocumentsDirectory());

  runApp(MyApp(
    appRouter: AppRouter(),
    connectivity: Connectivity(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;
  final Connectivity connectivity;

  MyApp({
    Key? key,
    required this.appRouter,
    required this.connectivity,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(),
        ),
        BlocProvider<SettingsCubit>(create: (context)=> SettingsCubit())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
        darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
        // onGenerateRoute: appRouter.onGenerateRoute,
        home:   JustPage( ),
      ),
    );
  }
}
