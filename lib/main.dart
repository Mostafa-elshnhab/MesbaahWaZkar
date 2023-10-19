import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/style/Themes/themes.dart';
import 'Shared/Cubit/AppCubit/States.dart';
import 'package:mespaha/Shared/Cubit/cubit_observe.dart';
import 'Shared/Cubit/AppCubit/cubit.dart';

import 'package:flutter/services.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,);
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
            title: 'مُسَبِّحة و أذكار',
            darkTheme: darkTheme,
            theme: lightTheme,
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
