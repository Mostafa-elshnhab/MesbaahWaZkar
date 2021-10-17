import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/States.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/cubit.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';

String? comingZeker;
String? comingTekrar;

class ZekerTekrar extends StatelessWidget {
  ZekerTekrar({String? zeker, String? tekrar}) {
    comingZeker = zeker;
    comingTekrar = tekrar;
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.only(
                              top: 10.0, end: 10, start: 10),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("assets/images/zakharef.jpg"),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Center(
                              child: SelectableText(
                                '$comingZeker',
                                textDirection: TextDirection.rtl,
                                style: Theme.of(context).textTheme.button,
                              ),
                            ),
                          ),
                        ),
                        MesbahaBuilder(
                            context: context,
                            counter: cubit.Counter3,
                            showAlertMethoud: () {
                              cubit.Counter3 = 0;
                              Navigator.of(context).pop();
                            },
                            onGesturedTapMethoud: () {
                              cubit.ChanegeCounter3(
                                  context: context,
                                  comingTekrar: comingTekrar,
                                  comingZeker: comingZeker);
                            }),
                        Container(
                          width: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              image: AssetImage("assets/images/zakharef.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: Center(
                            child: SelectableText(
                              'التكرار: $comingTekrar ',
                              textDirection: TextDirection.rtl,
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
