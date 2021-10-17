import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/States.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/cubit.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';

int Counter2 = 0;
int countZeker = 0;

class khetamElsalah extends StatelessWidget {
  bool isDrawer = false;
  khetamElsalah({isDrawer}) {
    this.isDrawer = isDrawer;
  }
  final Iterable<Duration> pauses = [
    const Duration(milliseconds: 500),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: isDrawer
              ? AppBar(
                  title: Text(
                    'ختام الصلاة',
                  ),
                  centerTitle: true,
                  leadingWidth: 0,
                )
              : null,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    width: 300,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: cubit.isDark ? Colors.white : Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        cubit.zekerTitele[countZeker],
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: cubit.isDark ? Colors.black : Colors.white,
                            fontFamily: 'NotoKufi'),
                      ),
                    ),
                  ),
                ),
                MesbahaBuilder(
                  context: context,
                  counter: Counter2,
                  showAlertMethoud: () {
                    Counter2 = 0;
                    countZeker = 0;
                    cubit.setCounter2();
                    Navigator.of(context).pop();
                  },
                  onGesturedTapMethoud: () {
                    Counter2++;
                    if (Counter2 == 33) {
                      if (countZeker == 2) {
                        countZeker = 0;
                      } else {
                        Vibrate.vibrate();
                        countZeker = countZeker + 1;
                      }
                      Counter2 = 0;
                    }
                    cubit.setCounter2();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
