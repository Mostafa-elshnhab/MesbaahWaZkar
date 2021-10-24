import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:mespaha/Modules/elamsbha/elmesbha.dart';
import 'package:mespaha/Modules/elamsbha/khetamElsalah.dart';
import 'package:mespaha/Modules/elazkar/Alarbaen.dart';
import 'package:mespaha/Modules/elazkar/ahades.dart';
import 'package:mespaha/Modules/elazkar/doaa.dart';
import 'package:mespaha/Modules/elazkar/elazkar.dart';
import 'package:mespaha/Modules/elazkar/fav/fav.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'States.dart';
import 'package:mespaha/data/Api/zeker.dart';
import 'package:mespaha/data/fav/fav.dart';
import 'package:mespaha/data/zeker.dart';
import 'package:mespaha/layout/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(InitialAppState());
  static AppCubit get(context) => BlocProvider.of(context);
  void initState(context) {
    readJson().then((value) {
      ZekerData = value;
      print('dataaaaa $ZekerData');
      saveZekrData();
    });
    onOpen();
    Timer(Duration(seconds: 5), () {
      Navto(context, MyHomePage());
    });
    emit(InitialAppState());
  }

  int current = 0;

  List<String> titels = [
    'وَاذْكُرِ اسْمَ رَبِّكَ',
    'وَسَبِّحْ بِحَمْدِ رَبِّكَ',
  ];
  void changeTapbar(v) {
    current = v;
    emit(ChangeTapbarState());
  }

  final selected = List.filled(100, false);

  void onOpen() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Counter = prefs.getInt('counter') ?? 0;
    Counter2 = prefs.getInt('counter2') ?? 0;
    countZeker = prefs.getInt('countZeker') ?? 0;
    zekrTekrar = prefs.getInt('zekrTekrar') ?? 0;
    Zeker = prefs.getString('zeker') ?? '';
    print(Zeker);

    List<Map> getZeker() {
      List<String> messagesString = prefs.getStringList('ZekerData') ?? [];
      List<Map> ZekerMap = [];
      if (messagesString.isNotEmpty) {
        messagesString.forEach((element) {
          ZekerMap.add(json.decode(element));
        });
      }
      return ZekerMap;
    }

    List<Map> getfave() {
      List<String> messagesString = prefs.getStringList('FavData') ?? [];
      List<Map> FavMap = [];
      if (messagesString.isNotEmpty) {
        messagesString.forEach((element) {
          FavMap.add(json.decode(element));
        });
      }
      return FavMap;
    }

    print('nmjkhghfdghjkl${getfave()}');

    ZekerData = getZeker();
    FavData = getfave();
    ids = prefs.getStringList('idsData') ?? [];
  }

  List<dynamic> cZeker = [];

  getCzeker(name) {
    for (int i = 0; i < ZekerData.length; i++) {
      if (ZekerData[i]['category'] == name) {
        cZeker.add(ZekerData[i]);
      }
    }
    print('dsdasdasdas$cZeker');
    emit(GetDataAppState());
  }

  void saveFavData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> FavD = FavData.map((e) => json.encode(e)).toList();
    prefs.setStringList("FavData", FavD);
  }

  void savefavidsData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList("idsData", ids);
  }

  void ChangeFavtoActive({index, id, data}) {
    FavData.add(data);
    ids.add(id);
    savefavidsData();
    saveFavData();
    emit(FavIconActiveState());
  }

  void changeFavIcon(index) {
    selected[index] = !selected[index];
    emit(ChangeFavIconState());
  }

  void setCounter2() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter2', Counter2);
    prefs.setInt('countZeker', countZeker);
    emit(ChangeCounter2State());
  }

  List<String> zekerTitele = [
    'سُبْحَانَ اللَّه',
    'الْحَمْدُ للّهِ',
    'اللَّهُ أَكْبَرُ',
  ];

  void ChangeFavtoDActive({id, index}) {
    for (int i = 0; i < FavData.length; i++) {
      print(index);
      if (id == FavData[i]['_id']) {
        FavData.removeAt(i);
        saveFavData();
      }
    }
    for (int i = 0; i < ids.length; i++) {
      if (id == ids[i]) {
        ids.removeAt(i);
        savefavidsData();
      }
    }
    emit(FavIconDActiveState());
  }

  void setCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', Counter);
    prefs.setInt('zekrTekrar', zekrTekrar);
    prefs.setString('zeker', Zeker);
    emit(ChangeCounterState());
  }

  int allZecercurrent = 0;
  List<String> AllZekertitels = [
    'الأذكار',
    'أدعية',
    'هدي نبوي',
    'الأربعين النووية',
    'المفضلة',
  ];
  List<Widget> Pages = [
    elazkar(
      isdrawer: false,
    ),
    doaa(
      isdrawer: false,
    ),
    ahades(
      isdrawer: false,
    ),
    Alarbaen(
      isdrawer: false,
    ),
    FavPage(
      isdrawer: false,
    ),
  ];
  void chanegAllzekerNavBar(index) {
    allZecercurrent = index;
    emit(ChangeAllzekerNavBarState());
  }

  changeCount() {
    emit(ChangeCountState());
  }

  int AllMesbahaCurrent = 0;
  List<String> AllMesbahatitels = [
    'ختام الصلاة',
    'تسبيح وذكر',
  ];
  List<Widget> mesbahaPages = [
    khetamElsalah(
      isDrawer: false,
    ),
    elmesbha(
      isDrawer: false,
    ),
  ];
  void chanegAllMesbahaNavBar(index) {
    AllMesbahaCurrent = index;
    emit(ChangeAllMesbahaNavBarState());
  }

  bool isEmpty = true;
  void CheckIsEmpty() {
    if (FavData.length == 0) {
      isEmpty = false;
      emit(CheckIsEmptyState());
    }
  }

  void DeleteFavItem(index, context) {
    for (int i = 0; i < ids.length; i++) {
      if (FavData[index]['_id'] == ids[i]) {
        ids.removeAt(i);

        savefavidsData();
        FavData.removeAt(index);
        saveFavData();
      }
    }

    Navigator.of(context).pop();
    emit(DeleteFavItemState());
  }

  int Counter3 = 0;
  void ChanegeCounter3({comingTekrar, comingZeker, context}) {
    Counter3++;

    print(comingTekrar);
    if (Counter3 == int.parse(comingTekrar!)) {
      showSnackBar(context, 'لقد أتممت $Counter3 من ${comingZeker}');
      Vibrate.vibrate();
      Counter3 = 0;
    }
    emit(ChangeCounter3State());
  }

  bool isDark = false;

  void onStateChanged(bool isDarkModeEnabled) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = isDarkModeEnabled;
    prefs.setBool('idDark', isDark);
    print(isDark);
    Vibrate.vibrate();
    emit(ChangeModeState());
  }

  void getMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDark = prefs.getBool('idDark') ?? false;
    emit(GetModeState());
  }
}
