import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import '../../Shared/Cubit/AppCubit/States.dart';
import '../../Shared/Cubit/AppCubit/cubit.dart';
import 'package:mespaha/data/zeker.dart';

class Zeker extends StatelessWidget {
  Zeker({this.name});
  String? name;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..getCzeker(name),
      child: BlocConsumer<AppCubit, AppStates>(listener: (context, state) {
        if (state is changeFavIconState) {}
      }, builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        var zekerData = AppCubit.get(context).cZeker;
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white70,
              title: Text(
                name!,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                    fontFamily: 'NotoKufi'),
              ),
              centerTitle: true,
              leadingWidth: 0,
            ),
            body: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          String id = zekerData[index]['_id'];

                          for (int i = 0; i < ids.length; i++) {
                            if (id == ids[i]) {
                              cubit.selected[index] = true;
                            }
                          }

                          return ZekerBuilder(
                              index: index,
                              context: context,
                              cubit: cubit,
                              zekerData: zekerData,
                              fav: false);
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: zekerData.length))));
      }),
    );
  }
}
