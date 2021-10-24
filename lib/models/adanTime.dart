class AdanModel {
  int? code;
  String? status;
  Data? data;

  AdanModel.fromJSON(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    data = json['data'] != null ? Data.fromJSON(json['data']) : null;
  }
}

class Data {
  Timings? timings;
  Date? date;

  Data.fromJSON(Map<String, dynamic> json) {
    timings =
        json['timings'] != null ? Timings.fromJSON(json['timings']) : null;
    date = json['date'] != null ? Date.fromJSON(json['date']) : null;
  }
}

class Timings {
  String? Fajr;
  String? Sunrise;
  String? Dhuhr;
  String? Asr;
  String? Sunset;
  String? Maghrib;
  String? Isha;
  String? Imsak;
  String? Midnight;
  Timings.fromJSON(Map<String, dynamic> json) {
    Fajr = json['Fajr'];
    Sunrise = json['Sunrise'];
    Dhuhr = json['Dhuhr'];
    Asr = json['Asr'];
    Sunset = json['Sunset'];
    Maghrib = json['Maghrib'];
    Isha = json['Isha'];
    Imsak = json['Imsak'];
    Midnight = json['Midnight'];
  }
}

class Date {
  String? readable;
  Hijri? hijri;

  Date.fromJSON(Map<String, dynamic> json) {
    readable = json['readable'];
    hijri = json['hijri'] != null ? Hijri.fromJSON(json['hijri']) : null;
  }
}

class Hijri {
  String? day;
  String? weekday;
  String? month;
  String? year;
  Hijri.fromJSON(Map<String, dynamic> json) {
    day = json['day'];
    weekday = json['weekday']['ar'];
    month = json['month']['ar'];
    year = json['year'];
  }
}
