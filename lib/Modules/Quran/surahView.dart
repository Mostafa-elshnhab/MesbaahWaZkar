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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
          appBar: AppBar(
            title: Text('$name'),
          ),
          body: FutureBuilder(
            future: QuranAPI().getSourh(number),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              for (int i = 0; i < snapshot.data!.data[0].ayah.length; i++) {
                sourh = sourh +
                    snapshot.data.data[0].ayah[i].text +
                    '  -  ' +
                    snapshot.data.data[0].ayah[i].number.toString();
              }
              print(sourh);
              return CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => line(height, index, width,
                            snapshot.data!.data[0].ayah, context),
                        childCount: snapshot.data!.data[0].ayah.length),
                  )
                ],
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
          )),
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
                .copyWith(fontSize: height * 0.03, fontFamily: 'Quran')),
      ),
    );
  }
}
