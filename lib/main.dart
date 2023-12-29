import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tests/counterPresenation/counterTestScreens/homePage.dart';
import 'package:flutter_bloc_tests/firebase_options.dart';
import 'package:flutter_bloc_tests/notificationTests/firebaseServices/firebaseApi.dart';
import 'package:flutter_bloc_tests/notificationTests/presentation/homePageNoti.dart';
import 'package:flutter_bloc_tests/notificationTests/presentation/notificationScreen.dart';
import 'package:flutter_bloc_tests/otpTest/pincodeVerificationScreen.dart';
import 'package:flutter_bloc_tests/savingOrderTest/logic/draftOrderCubit/draft_orders_cubit.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/customersList.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/draftOrdersScreen.dart';
import 'package:flutter_bloc_tests/savingOrderTest/presentation/expansionTileTest.dart';
import 'package:flutter_bloc_tests/selecableListView/secondVariantList.dart';
import 'package:flutter_bloc_tests/selecableListView/selectableListScreen.dart';
import 'package:flutter_bloc_tests/testUserAgent/testLoginPage.dart';
import 'package:flutter_bloc_tests/webSocketsTest/webSocketPage.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_bloc_tests/counterPresenation/colors/colorSchemes.dart';
import 'package:flutter_bloc_tests/counterPresenation/routes/appRoutes.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'counterAndInetLogic/cubit/couter_cubit_cubit.dart';
import 'counterAndInetLogic/cubit/cubitInternet/internet_cubit.dart';
import 'counterAndInetLogic/cubit/settings_cubit.dart';
import 'package:firebase_core/firebase_core.dart';

final navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  HydratedBloc.storage = await HydratedStorage.build(
      storageDirectory: await getApplicationDocumentsDirectory());

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
        BlocProvider<DraftOrdersCubit>(
          create: (context) => DraftOrdersCubit(),
        ),
        BlocProvider<SettingsCubit>(create: (context) => SettingsCubit())
      ],
      child:

          // MaterialApp(
          //   debugShowCheckedModeBanner: false,
          //   theme: ThemeData(useMaterial3: true, colorScheme: lightColorScheme),
          //   darkTheme: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
          //   // onGenerateRoute: appRouter.onGenerateRoute,
          //   // home:   CustomersPage(),
          //   home: HomePageNotificationTest(),
          // )

          MaterialApp(
        title: 'Push notificaton',
        theme: ThemeData(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
        navigatorKey: navigatorKey,
        home: WebSocketTestPage(
          channel: IOWebSocketChannel.connect("ws://echo.websocket.org"),
        ),
        routes: {
          NotificationScreen.route: (context) => const NotificationScreen()
        },
      ),
    );
  }
}
