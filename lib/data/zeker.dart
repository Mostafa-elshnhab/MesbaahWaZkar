import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

List<dynamic> ZekerData = [];
void saveZekrData() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> ZekerD = ZekerData.map((e) => json.encode(e)).toList();
  prefs.setStringList("ZekerData", ZekerD);
}

List<String> ids = [];
