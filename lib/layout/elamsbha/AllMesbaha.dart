import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Shared/Cubit/AppCubit/States.dart';
import '../../Shared/Cubit/AppCubit/cubit.dart';

class AllMesbaha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.AllMesbahaCurrent,
              selectedFontSize: 16,
              elevation: 0,
              unselectedLabelStyle: TextStyle(fontFamily: 'ReemKufi'),
              selectedLabelStyle: TextStyle(fontFamily: 'ReemKufi'),
              onTap: (index) {
                cubit.chanegAllMesbahaNavBar(index);
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/sebha.png',
                    width: 30,
                    height: 30,
                  ),
                  label: 'ختام الصلاه',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset(
                    'assets/images/home.png',
                    width: 30,
                    height: 30,
                  ),
                  label: 'تسبيح و ذكر',
                ),
              ],
            ),
            body: cubit.mesbahaPages[cubit.AllMesbahaCurrent]);
      },
    );
  }
}
