import 'package:flutter/material.dart';
import 'package:mespaha/Modules/Quran/surahView.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:mespaha/data/Api/quranAPI.dart';

class SurahIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
        appBar: AppBar(
          title: Text(
            'الفِهْرِس',
          ),
          leading: SizedBox(),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        ),
        body: FutureBuilder(
          future: QuranAPI().getSurahList(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Container(
              child: ListView.separated(
                separatorBuilder: (context, index) {
                  return Divider(
                    color: Colors.lightBlue,
                    height: 2.0,
                  );
                },
                itemCount: snapshot.data.surahs.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    onLongPress: () {},
                    leading: Text(
                      "${snapshot.data.surahs[index].number}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    title: Text(
                      "${snapshot.data.surahs[index].englishName}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
//                    subtitle: Text(
//                        "${snapshot.data.surahs[index].englishNameTranslation}"),
                    trailing: Text(
                      "${snapshot.data.surahs[index].name}",
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    onTap: () {
                      Navto(
                          context,
                          SurahView(snapshot.data.surahs[index].number,
                              snapshot.data.surahs[index].name));
                    },
                  );
                },
              ),
            );
          },
        ));
  }
}
