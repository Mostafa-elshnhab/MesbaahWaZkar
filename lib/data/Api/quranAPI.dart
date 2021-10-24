import 'package:flutter/services.dart';

import 'package:mespaha/models/SuraData.dart';

import 'dart:async';
import 'dart:convert';

import 'package:mespaha/models/surahModel.dart';

class QuranAPI {
  Future<SurahsList> getSurahList() async {
    final String response = await rootBundle.loadString('assets/fehres.json');
    return SurahsList.fromJSON(json.decode(response));
  }

  Future<SurahD> getSourh(int? number) async {
    final String response =
        await rootBundle.loadString('assets/Quran/s$number.json');
    print(json.decode(response));
    return SurahD.fromJSON(json.decode(response));
  }
}
