import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Shared/Cubit/AppCubit/States.dart';
import '../../Shared/Cubit/AppCubit/cubit.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:mespaha/data/azkar.dart';

class elazkar extends StatelessWidget {
  bool isDrawer = false;
  elazkar({isdrawer}) {
    this.isDrawer = isdrawer;
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            appBar: isDrawer
                ? AppBar(
                    title: Text(
                      'الأذكار',
                    ),
                    centerTitle: true,
                    leadingWidth: 0,
                  )
                : null,
            body: AllZekerPageElemnt(data: azkarData, arbaen: false));
      },
    );
  }
}
