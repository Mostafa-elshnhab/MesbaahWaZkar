import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getAdanTime(String city, String country) async {
  http.Response response = await http.get(Uri.parse(
      "https://api.aladhan.com/v1/timingsByCity?city=$city&country=$country"));
  Map<String, dynamic> data = json.decode(response.body);
  return data;
}
