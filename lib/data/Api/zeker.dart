import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

Future<List> getZekerFB(name) async {
  http.Response response = await http.get(Uri.parse(
      "https://azkars.herokuapp.com/azkars?_sort=category:ASC&_where[0][category]=$name"));
  List data = json.decode(response.body);
  return data;
}

Future<List> getAllZekerFB() async {
  http.Response response = await http
      .get(Uri.parse("https://azkars.herokuapp.com/azkars?_limit=400"));
  List data = json.decode(response.body);
  return data;
}

Future<List> readJson() async {
  final String response = await rootBundle.loadString('assets/azkar.json');
  final data = await json.decode(response);
  return data;
}
