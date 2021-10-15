import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Shared/Cubit/AppCubit/States.dart';
import 'package:mespaha/Shared/Cubit/cubit_observe.dart';
import 'Shared/Cubit/AppCubit/cubit.dart';

import 'package:flutter/services.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getMode(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            darkTheme: ThemeData(
              primarySwatch: Colors.blue,
              dialogBackgroundColor: Color(0xFF253341),
              snackBarTheme: SnackBarThemeData(
                actionTextColor: Colors.black,
                disabledActionTextColor: Colors.black,
                backgroundColor: Colors.lightBlueAccent.withOpacity(.7),
              ),
              textTheme: TextTheme(
                  caption: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'NotoKufi'),
                  button: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'NotoKufi',
                  ),
                  bodyText2: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'NotoKufi',
                  ),
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'NotoKufi',
                  )),
              scaffoldBackgroundColor: Color(0xFF15202B),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Color(0xFF253341),
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.white,
                  selectedItemColor: Colors.lightBlueAccent),
              tabBarTheme: TabBarTheme(
                labelColor: Colors.white,
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoKufi',
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'NotoKufi',
                ),
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: Color(0xFF253341),
                elevation: 0,
                backwardsCompatibility: false,
                iconTheme: IconThemeData(color: Colors.white, size: 22),
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoKufi',
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Color(0xFF253341),
                    statusBarIconBrightness: Brightness.light),
              ),
            ),
            theme: ThemeData(
              primarySwatch: Colors.blue,
              dialogBackgroundColor: Colors.white,
              snackBarTheme: SnackBarThemeData(
                backgroundColor: Colors.black.withOpacity(.7),
              ),
              textTheme: TextTheme(
                  caption: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontFamily: 'NotoKufi'),
                  button: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'NotoKufi',
                  ),
                  bodyText2: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'NotoKufi',
                  ),
                  bodyText1: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    fontFamily: 'NotoKufi',
                  )),
              scaffoldBackgroundColor: Colors.white,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white.withOpacity(.5),
                  type: BottomNavigationBarType.fixed,
                  unselectedItemColor: Colors.black,
                  selectedItemColor: Colors.lightBlueAccent),
              tabBarTheme: TabBarTheme(
                labelColor: Colors.black,
                labelStyle: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoKufi',
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: 14.0,
                  fontFamily: 'NotoKufi',
                ),
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                backwardsCompatibility: false,
                iconTheme: IconThemeData(color: Colors.black, size: 22),
                centerTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'NotoKufi',
                ),
                systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark),
              ),
            ),
            themeMode:
                AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => AppCubit()..initState(context),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return Scaffold(
//              backgroundColor: Colors.black87.withOpacity(.7),
              body: Stack(
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/back3.png',
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                ],
              ),
            );
          },
        ));
  }
}
