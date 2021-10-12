import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/States.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/cubit.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:mespaha/data/fav/fav.dart';

class FavPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..CheckIsEmpty(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: !cubit.isEmpty
                  ? Column(
                      children: [
                        Expanded(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.favorite_border,
                                  size: 140,
                                  color: Colors.lightBlueAccent,
                                ),
                                Text(
                                  'لا يوجد أذكار مفضلة',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoKufi'),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'الأذكار المفضلة لديك سوف تظهر هنا',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontFamily: 'NotoKufi'),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  'فقط قم بالضغط علي القلب في اي ذكر',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black54,
                                      fontFamily: 'NotoKufi'),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return ZekerBuilder(
                                index: index,
                                context: context,
                                cubit: cubit,
                                zekerData: FavData,
                                fav: true);
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              height: 20,
                            );
                          },
                          itemCount: FavData.length)),
            ),
          );
        },
      ),
    );
  }
}
