import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mespaha/layout/elamsbha/zekerTekrar.dart';
import 'package:mespaha/layout/elazkar/zeker.dart';
import 'package:share_plus/share_plus.dart';

Widget AllZekerPageElemnt({required data ,required bool arbaen }) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.separated(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Zeker(
                              name: data[index].title,
                            )));
              },
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    image: DecorationImage(
                      image: AssetImage("assets/images/zakharef.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child:arbaen?Column(
                        children: [
                          Text(
                            '${data[index].title}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoKufi'),
                          ),
                          Text(
                            '${data[index].name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
                                fontFamily: 'NotoKufi'),
                          ),
                        ],
                      ): Text(
                        '${data[index].title}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoKufi'),
                      ),
                    ),
                  )),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              height: 15,
            );
          },
          itemCount: data.length),
    );

ShowAlertDialog(
    {required context, required title, required IconData icon, required yes}) {
  AlertDialog alert = AlertDialog(
      title: Column(
    textDirection: TextDirection.rtl,
    children: [
      Icon(
        icon,
        color: Colors.red,
        size: 60,
      ),
      SizedBox(
        height: 12,
      ),
      Text(
        '$title',
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'NotoKufi'),
      ),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: MaterialButton(
            height: 50,
            minWidth: double.infinity,
            onPressed: yes,
            child: Text(
              'نعم',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'NotoKufi',
              ),
            ),
            color: Colors.black54,
          )),
      TextButton(
        child: Text(
          "لا",
          style: TextStyle(
              fontSize: 20, color: Colors.black54, fontFamily: 'NotoKufi'),
        ),
        onPressed: () {
//
          Navigator.of(context).pop();
//
        },
      )
    ],
  ));

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Widget ZekerBuilder(
    {required zekerData,
    required index,
    required BuildContext context,
    required cubit,
    required bool fav}) {
  String zeker = zekerData[index]['zekr'];
  String reference = zekerData[index]['reference'];
  String description = zekerData[index]['description'];
  String count = zekerData[index]['count'];
  String id = zekerData[index]['_id'];
  return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: AssetImage("assets/images/zakharef.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: SelectableText(
                '$zeker',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'NotoKufi'),
              ),
            ),
            !(reference == "")
                ? SizedBox(
                    height: 5,
                  )
                : SizedBox(),
            !(reference == "")
                ? Text(
                    'المرجع : $reference',
                    style: TextStyle(
                        fontSize: 17,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoKufi'),
                  )
                : SizedBox(),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              height: 1,
              color: Colors.grey,
            ),
            !(description == "")
                ? Text(
                    description,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.lightBlue,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'NotoKufi'),
                  )
                : SizedBox(),
            SizedBox(
              height: 5,
            ),
            Container(
              width: double.infinity,
              alignment: AlignmentDirectional.center,
              child: Row(
                children: [
                  !(count == "")
                      ? Expanded(
                          flex: 2,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ZekerTekrar(
                                            tekrar: count,
                                            zeker: zeker,
                                          )));
                            },
                            child: Row(
                              children: [
                                Text(
                                  ' التكرار:',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.teal,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'NotoKufi'),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Container(
                                  width: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.white70,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '$count',
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.lightBlue,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'NotoKufi'),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      : SizedBox(),
                  !fav
                      ? Expanded(
                          flex: 1,
                          child: !(cubit.selected[index])
                              ? IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    size: 30,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  onPressed: () {
                                    cubit.changeFavIcon(index);
                                    cubit.ChangeFavtoActive(
                                        id: id,
                                        data: zekerData[index],
                                        index: index);
                                    cubit.showSnackBar(context,
                                        "تم الأضافة إلي الأذكار المفضلة");
                                  },
                                )
                              : IconButton(
                                  icon: Icon(
                                    Icons.favorite,
                                    size: 30,
                                    color: Colors.lightBlueAccent,
                                  ),
                                  onPressed: () {
                                    ShowAlertDialog(
                                        context: context,
                                        title: 'هل تريد حذفه من المفضلة؟',
                                        icon: Icons.warning_outlined,
                                        yes: () {
                                          cubit.changeFavIcon(index);
                                          cubit.DeleteFavItem(index, context);
                                          cubit.CheckIsEmpty();
                                        });
                                  },
                                ))
                      : Expanded(
                          flex: 1,
                          child: IconButton(
                            icon: Icon(
                              Icons.favorite,
                              size: 30,
                              color: Colors.lightBlueAccent,
                            ),
                            onPressed: () {
                              ShowAlertDialog(
                                  context: context,
                                  title: 'هل تريد حذفه من المفضلة؟',
                                  icon: Icons.warning_outlined,
                                  yes: () {
                                    cubit.DeleteFavItem(index, context);
                                    cubit.CheckIsEmpty();
                                  });
                            },
                          )),
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        icon: Icon(
                          Icons.copy,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: zeker)).then(
                              (value) => cubit.showSnackBar(
                                  context, 'تم النسخ في الحافظه'));
                        }),
                  ),
                  Expanded(
                    flex: 2,
                    child: GestureDetector(
                      onTap: () {
                        print('invite');
                        Share.share('$zeker');
                      },
                      child: Row(
                        textDirection: TextDirection.ltr,
                        children: [
                          IconButton(
                            icon: Icon(Icons.share_rounded),
                            onPressed: () {
                              print('invite');
                              Share.share('$zeker');
                            },
                          ),
                          Text(
                            'مشاركه',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'NotoKufi'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ));
}
Widget AllStack(page)=>Stack(
  children: [
    Image.asset(
      'assets/images/back2.jpg',
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.cover,
    ),
    page
  ],
);