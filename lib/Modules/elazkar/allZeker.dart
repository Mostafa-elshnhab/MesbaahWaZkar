import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Shared/Cubit/AppCubit/States.dart';
import '../../Shared/Cubit/AppCubit/cubit.dart';

class AllZeker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: cubit.allZecercurrent,
            selectedFontSize: 16,
            elevation: 0,
            unselectedLabelStyle: TextStyle(fontFamily: 'ReemKufi'),
            selectedLabelStyle: TextStyle(fontFamily: 'ReemKufi'),
            onTap: (index) {
              cubit.chanegAllzekerNavBar(index);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/azkar.png',
                  width: 30,
                  height: 30,
                ),
                label: 'الأذكار',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/doaa.png',
                  width: 30,
                  height: 30,
                ),
                label: 'أدعية',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/ahades.png',
                  width: 30,
                  height: 30,
                ),
                label: 'هدي نبوي',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/Alarbaen.png',
                  width: 30,
                  height: 30,
                ),
                label: 'الأربعين النووية',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  size: 30,
                  color: Colors.lightBlueAccent,
                ),
                label: 'المفضلة',
              ),
            ],
          ),
          body: cubit.Pages[cubit.allZecercurrent],
        );
      },
    );
  }
}
