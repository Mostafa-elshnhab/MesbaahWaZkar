import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';

Future<List> readJson() async {
  final String response = await rootBundle.loadString('assets/azkar.json');
  final data = await json.decode(response);
  return data;
}
