import 'dart:async';
import 'dart:convert';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:mespaha/layout/elazkar/fav/fav.dart';
import 'States.dart';
import 'package:mespaha/data/Api/zeker.dart';
import 'package:mespaha/data/fav/fav.dart';
import 'package:mespaha/data/zeker.dart';
import 'package:mespaha/layout/elamsbha/elmesbha.dart';
import 'package:mespaha/layout/elamsbha/khetamElsalah.dart';
import 'package:mespaha/layout/elazkar/Alarbaen.dart';
import 'package:mespaha/layout/elazkar/ahades.dart';
import 'package:mespaha/layout/elazkar/doaa.dart';
import 'package:mespaha/layout/elazkar/elazkar.dart';
import 'package:mespaha/layout/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(initialAppState());
  static AppCubit get(context) => BlocProvider.of(context);
  void initState(context) {
    readJson().then((value) {
      ZekerData = value;
      print('dataaaaa $ZekerData');
      saveZekrData();
    });
    onOpen();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => MyHomePage()));
    });
    emit(initialAppState());
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
    emit(changeFavIconState());
  }

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

  void showSnackBar(context, String text) {
    final snackBar = SnackBar(
        backgroundColor: Colors.black.withOpacity(.7),
        padding: EdgeInsetsDirectional.only(end: 20),
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontFamily: 'NotoKufi'),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
    elazkar(),
    doaa(),
    ahades(),
    Alarbaen(),
    FavPage(),
  ];
  void chanegAllzekerNavBar(index) {
    allZecercurrent = index;
    emit(ChangeAllzekerNavBarState());
  }

  changeCount() {
    emit(changeCountState());
  }

  int AllMesbahaCurrent = 0;
  List<String> AllMesbahatitels = [
    'ختام الصلاة',
    'تسبيح وذكر',
  ];
  List<Widget> mesbahaPages = [
    khetamElsalah(),
    elmesbha(),
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
}