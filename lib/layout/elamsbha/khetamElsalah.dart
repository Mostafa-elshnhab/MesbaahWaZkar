import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/States.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/cubit.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';

class khetamElsalah extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      cubit.zekerTitele[cubit.countZeker],
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'NotoKufi'),
                    ),
                  ),
                ),
              ),
              MesbahaBuilder(
                context: context,
                counter: cubit.Counter2,
                showAlertMethoud: () {
                  cubit.Counter2 = 0;
                  cubit.countZeker = 0;
                  cubit.setCounter2();
                  Navigator.of(context).pop();
                },
                onGesturedTapMethoud: () {
                  cubit.Counter2++;
                  if (cubit.Counter2 == 33) {
                    if (cubit.countZeker == 2) {
                      cubit.countZeker = 0;
                    } else {
                      cubit.countZeker = cubit.countZeker + 1;
                    }
                    cubit.Counter2 = 0;
                  }
                  cubit.setCounter2();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
