import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import '../Shared/Cubit/AppCubit/States.dart';
import '../Shared/Cubit/AppCubit/cubit.dart';
import 'package:mespaha/layout/elamsbha/AllMesbaha.dart';

import 'elazkar/allZeker.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          print(state);
        },
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          Future<bool> onWillPop() {
            return ShowAlertDialog(
              context: context,
              title: 'هل تريد الخروج من التطبيق؟',
              icon: Icons.exit_to_app_outlined,
              yes: () {
                SystemChannels.platform.invokeMethod('SystemNavigator.pop');
              },
            );
          }

          return WillPopScope(
            onWillPop: onWillPop,
            child: DefaultTabController(
                length: 2,
                child: Scaffold(
                  appBar: PreferredSize(
                    preferredSize: Size.fromHeight(106),
                    child: Container(
                      decoration:
                          BoxDecoration(color: Colors.black87.withOpacity(.7)),
                      child: Column(
                        children: [
                          AppBar(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            title: Text(
                              cubit.titels[cubit.current],
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'NotoKufi'),
                            ),
                            centerTitle: true,
                            leadingWidth: 0,
                          ),
                          TabBar(
                              onTap: (v) {
                                cubit.changeTapbar(v);
                              },
                              indicatorColor: Colors.white,
                              indicatorWeight: 2,
                              labelStyle: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'NotoKufi',
                                  color: Colors.black),
                              tabs: [
                                Tab(
                                  text: cubit
                                      .AllZekertitels[cubit.allZecercurrent],
                                ),
                                Tab(
                                  text: cubit.AllMesbahatitels[
                                      cubit.AllMesbahaCurrent],
                                )
                              ]),
                        ],
                      ),
                    ),
                  ),
                  body: TabBarView(children: [AllZeker(), AllMesbaha()]),
                )),
          );
        },
      ),
    );
  }
}
