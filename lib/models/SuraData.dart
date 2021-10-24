//class SurahD {
//  int? code;
//  String? status;
//  Data? data;
//  SurahD.fromJSON(Map<String, dynamic> json) {
//    code = json['code'];
//    status = json['status'];
//    data = json['data'] != null ? Data.fromJSON(json['data']) : null;
//  }
//}
class SurahD {
  final List<Data>? data;

  SurahD({this.data});

  factory SurahD.fromJSON(Map<String, dynamic> json) {
    Iterable datalist = json['data'];
    List<Data> DataList = datalist.map((i) => Data.fromJSON(i)).toList();

    return SurahD(data: DataList);
  }
}

class Data {
  String? name;
  int? numberOfAyahs;
  List<Ayah>? ayah;
//  final List<Ayat>? ayahs;

  Data({
    this.name,
    this.numberOfAyahs,
    this.ayah,
  });

  factory Data.fromJSON(Map<String, dynamic> json) {
    Iterable ayahs = json['ayahs'];
    List<Ayah> ayahsList = ayahs.map((e) => Ayah.fromJSON((e))).toList();

    return Data(
        name: json['name'],
        numberOfAyahs: json['numberOfAyahs'],
        ayah: ayahsList);
  }
}
//
//class Data {
//  String? name;
//  int? numberOfAyahs;
//  List<Ayah>? ayah;
//
//  Data.fromJSON(Map<String, dynamic> json) {
//    name = json['name'];
//    numberOfAyahs = json['numberOfAyahs'];
//    Iterable ayahlist = json['ayahs'];
//    ayah = ayahlist.map((i) => Ayah.fromJSON(i)).toList();
//  }
//}

class Ayah {
  final String? text;
  final int? number;
  Ayah({this.text, this.number});

  factory Ayah.fromJSON(Map<String, dynamic> json) {
    return Ayah(text: json['text'], number: json['numberInSurah']);
  }
}
//class Ayah {
//  String? text;
//  int? number;
//  int? page;
//  Ayah.fromJSON(Map<String, dynamic> json) {
//    text = json['text'];
//    number = json['number'];
//    page = json['page'];
//  }
//}
