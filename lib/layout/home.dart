import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:mespaha/layout/elamsbha/elmesbha.dart';
import 'package:mespaha/layout/elamsbha/khetamElsalah.dart';
import 'package:mespaha/layout/elazkar/Alarbaen.dart';
import 'package:mespaha/layout/elazkar/doaa.dart';
import '../Shared/Cubit/AppCubit/States.dart';
import '../Shared/Cubit/AppCubit/cubit.dart';
import 'package:mespaha/layout/elamsbha/AllMesbaha.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

import 'elazkar/ahades.dart';
import 'elazkar/allZeker.dart';
import 'elazkar/elazkar.dart';
import 'elazkar/fav/fav.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
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
                    decoration: BoxDecoration(
                      color: cubit.isDark ? Color(0xFF253341) : Colors.white,
                    ),
                    child: Column(
                      children: [
                        AppBar(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          title: Text(
                            cubit.titels[cubit.current],
                            style: Theme.of(context).textTheme.caption,
                          ),
                          centerTitle: true,
                          leadingWidth: 0,
                        ),
                        TabBar(
                            onTap: (v) {
                              cubit.changeTapbar(v);
                            },
                            indicatorWeight: 2,
                            indicatorColor:
                                cubit.isDark ? Colors.white : Colors.black,
                            tabs: [
                              Tab(
                                text:
                                    cubit.AllZekertitels[cubit.allZecercurrent],
                              ),
                              Tab(
                                text: cubit
                                    .AllMesbahatitels[cubit.AllMesbahaCurrent],
                              )
                            ]),
                      ],
                    ),
                  ),
                ),
                endDrawer: Drawer(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: Container(
                      color: cubit.isDark ? Color(0xFF253341) : Colors.white,
                      child: Column(
                        children: [
                          Container(
                            height: 100,
                            width: double.infinity,
                            child: DrawerHeader(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: <Color>[
                                    const Color.fromRGBO(5, 31, 56, 1),
                                    const Color.fromRGBO(11, 70, 126, 1)
                                  ],
                                  tileMode: TileMode.clamp,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(top: 3),
                                child: Text(
                                  'مسبحه واذكار',
                                  style: TextStyle(
                                    fontSize: 23,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                ListTile(
                                  horizontalTitleGap: 0,
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  leading: Image.asset(
                                    'assets/images/azkar.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  title: Text(
                                    'الأذكار',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onTap: () {
                                    Navto(
                                        context,
                                        elazkar(
                                          isdrawer: true,
                                        ));
                                  },
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ListTile(
                                  horizontalTitleGap: 0,
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  leading: Image.asset(
                                    'assets/images/doaa.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  title: Text(
                                    'أدعية',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onTap: () {
                                    Navto(
                                        context,
                                        doaa(
                                          isdrawer: true,
                                        ));
                                  },
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ListTile(
                                  horizontalTitleGap: 0,
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  leading: Image.asset(
                                    'assets/images/ahades.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  title: Text(
                                    'هدي نبوي',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onTap: () {
                                    Navto(
                                        context,
                                        ahades(
                                          isdrawer: true,
                                        ));
                                  },
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ListTile(
                                  horizontalTitleGap: 0,
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  leading: Image.asset(
                                    'assets/images/Alarbaen.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  title: Text(
                                    'الأربعين النووية',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onTap: () {
                                    Navto(
                                        context,
                                        Alarbaen(
                                          isdrawer: true,
                                        ));
                                  },
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ListTile(
                                  horizontalTitleGap: 0,
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  leading: Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  title: Text(
                                    'الأذكار المفضلة',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onTap: () {
                                    Navto(
                                        context,
                                        FavPage(
                                          isdrawer: true,
                                        ));
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Colors.grey.withOpacity(.7),
                                  height: 0,
                                  thickness: 1,
                                  endIndent: 15,
                                  indent: 15,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                ListTile(
                                  horizontalTitleGap: 0,
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  leading: Image.asset(
                                    'assets/images/sebha.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  title: Text(
                                    'ختام الصلاة',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onTap: () {
                                    Navto(
                                        context,
                                        khetamElsalah(
                                          isDrawer: true,
                                        ));
                                  },
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                ListTile(
                                  horizontalTitleGap: 0,
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  leading: Image.asset(
                                    'assets/images/home.png',
                                    width: 30,
                                    height: 30,
                                  ),
                                  title: Text(
                                    'تسبيح وذكر',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onTap: () {
                                    Navto(
                                        context,
                                        elmesbha(
                                          isDrawer: true,
                                        ));
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Divider(
                                  color: Colors.grey.withOpacity(.7),
                                  thickness: 1,
                                  endIndent: 15,
                                  indent: 15,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
//                                ListTile(
//                                  horizontalTitleGap: 0,
//                                  visualDensity: VisualDensity(
//                                      horizontal: 0, vertical: -4),
//                                  leading: Icon(
//                                    Icons.person,
//                                    size: 25,
//                                    color: HexColor('#EEAF41'),
//                                  ),
//                                  title: Text(
//                                    'الأذكار',
//                                    style:
//                                        Theme.of(context).textTheme.bodyText2,
//                                  ),
//                                  onTap: () {},
//                                ),
//                                ListTile(
//                                  horizontalTitleGap: 0,
//                                  visualDensity: VisualDensity(
//                                      horizontal: 0, vertical: -4),
//                                  leading: Icon(
//                                    Icons.chat_rounded,
//                                    size: 25,
//                                    color: HexColor('#EEAF41'),
//                                  ),
//                                  title: Text(
//                                    'الأذكار',
//                                    style:
//                                        Theme.of(context).textTheme.bodyText2,
//                                  ),
//                                  onTap: () {},
//                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.only(
                                      start: 15),
                                  child: Row(
                                    children: [
                                      Container(
                                        child: DayNightSwitcher(
                                          isDarkModeEnabled: cubit.isDark,
                                          onStateChanged: cubit.onStateChanged,
                                        ),
                                        width: 80,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(cubit.isDark ? 'ليلي' : 'نهاري'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                              padding: EdgeInsetsDirectional.only(end: 10),
                              alignment: AlignmentDirectional.topEnd,
                              child: Text(
                                '\u00a9 Mostafa Elshnhab',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(fontSize: 14),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                body: TabBarView(children: [AllZeker(), AllMesbaha()]),
              )),
        );
      },
    );
  }
}
