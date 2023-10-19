import 'package:arabic_numbers/arabic_numbers.dart';
import 'package:flutter/material.dart';

import 'package:mespaha/data/Api/quranAPI.dart';
import 'package:mespaha/models/SuraData.dart';
import 'dart:async';

class SurahView extends StatelessWidget {
  int? number;
  String? name;
  SurahView(this.number, this.name);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    String sourh = "";
    int ayahNum = 0;
    ArabicNumbers arabicNumber = ArabicNumbers();
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          // appBar:
          // AppBar(
          //   title: Text('$name'),
          // ),
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                title: Text('$name'),
                floating: true,
                snap: true,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) =>FutureBuilder(
                        future: QuranAPI().getSourh(number),
                        builder: (BuildContext context, AsyncSnapshot snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          ayahNum = 1;
                          for (var line  in snapshot.data.data[0].ayah) {
                            sourh += line.text;
                            sourh += " (${arabicNumber.convert(line.number)}) ";
                            ayahNum++;
                            // sourh = sourh +
                            //     snapshot.data.data[0].ayah[i].text +
                            //     '  -  ' +
                            //     snapshot.data.data[0].ayah[i].number.toString();
                          }
                          print(sourh);
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                        sourh,
                                        textScaleFactor: 1.3,
                                        textAlign: TextAlign.justify,
                                        style:Theme.of(context)
                                            .textTheme
                                            .bodyText2!
                                            .copyWith(fontSize: height * 0.018, fontFamily: 'Quran')
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
//            return Padding(
//              padding: const EdgeInsets.all(8.0),
//              child: Container(
//                child: ListView.separated(
//                  separatorBuilder: (context, index) {
//                    return Container();
//                  },
//                  itemCount: snapshot.data!.data[0].ayah.length,
//                  itemBuilder: (context, index) {
//                    return Center(
//                        child:
//                            Text("${snapshot.data.data[0].ayah[index].text}"));
//                  },
//                ),
//              ),
//            );
                        },
                      ),
                  childCount: 1, // Replace with your actual item count
                ),
              ),
            ],
          ),),
    );
  }

  line(double height, int index, double width, data, context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(width * 0.015, 0, 0, 0),
      child: ListTile(
        trailing: CircleAvatar(
          radius: height * 0.013,
          backgroundColor: Color(0xff04364f),
          child: CircleAvatar(
              radius: height * 0.012,
              backgroundColor: Colors.white,
              child: Text(
                data![index].number.toString(),
                style: TextStyle(fontSize: height * 0.015),
              )),
        ),
        title: Text(data![index].text!,
            textAlign: TextAlign.right,
            style: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontSize: height * 0.03, fontFamily: 'NotoKufi')),
      ),
    );
  }
}
