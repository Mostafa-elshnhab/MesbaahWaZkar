import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/Modules/MekatElsalah/Cubit/cubit.dart';
import 'package:mespaha/Modules/Quran/surahIndex_view.dart';
import 'package:mespaha/Modules/elamsbha/AllMesbaha.dart';
import 'package:mespaha/Modules/elamsbha/elmesbha.dart';
import 'package:mespaha/Modules/elamsbha/khetamElsalah.dart';
import 'package:mespaha/Modules/elazkar/Alarbaen.dart';
import 'package:mespaha/Modules/elazkar/ahades.dart';
import 'package:mespaha/Modules/elazkar/allZeker.dart';
import 'package:mespaha/Modules/elazkar/doaa.dart';
import 'package:mespaha/Modules/elazkar/elazkar.dart';
import 'package:mespaha/Modules/elazkar/fav/fav.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import '../Modules/MekatElsalah/AdanTime.dart';
import '../Shared/Cubit/AppCubit/States.dart';
import '../Shared/Cubit/AppCubit/cubit.dart';
import 'package:day_night_switcher/day_night_switcher.dart';

class MyHomePage extends StatelessWidget {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
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
                key: scaffoldKey,
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
                          actions: [
                            IconButton(
                                icon: Icon(Icons.menu),
                                onPressed: () =>
                                    scaffoldKey.currentState!.openEndDrawer()),
                          ],
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
                                  'وَقُل رَّبِّ اغْفِرْ وَارْحَمْ',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: ListView(
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
                                ListTile(
                                  horizontalTitleGap: 0,
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  leading: Image.asset(
                                    'assets/images/quran.png',
                                    width: 25,
                                    height: 25,
                                  ),
                                  title: Text(
                                    'القرآن الكريم',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onTap: () {
                                    Navto(context, SurahIndex());
                                  },
                                ),
                                ListTile(
                                  horizontalTitleGap: 0,
                                  visualDensity: VisualDensity(
                                      horizontal: 0, vertical: -4),
                                  leading: Image.asset(
                                    'assets/images/info.png',
                                    width: 25,
                                    height: 25,
                                  ),
                                  title: Text(
                                    'مواقيت الصلاة',
                                    style:
                                        Theme.of(context).textTheme.bodyText2,
                                  ),
                                  onTap: () {
                                    Navto(context, AdanTime());
                                  },
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
                              padding: EdgeInsetsDirectional.only(
                                  end: 15, bottom: 6),
                              alignment: AlignmentDirectional.topEnd,
                              child: Text(
                                '2021 \u00a9 Mostafa Elshnhab',
                                textDirection: TextDirection.ltr,
                                style: TextStyle(
                                    fontSize: 16, fontFamily: 'Oswald'),
                              )),
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
