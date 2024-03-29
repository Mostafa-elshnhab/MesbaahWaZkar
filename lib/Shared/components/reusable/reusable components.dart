import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:mespaha/Modules/elamsbha/zekerTekrar.dart';
import 'package:mespaha/Modules/elazkar/zeker.dart';
import 'package:mespaha/Shared/MediaQuery/sizeConfig.dart';
import 'package:share_plus/share_plus.dart';

Widget AllZekerPageElemnt(
        {required data, required bool arbaen, isDrawer, title}) =>
    Padding(
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
                      child: arbaen
                          ? Column(
                              children: [
                                Text(
                                  '${data[index].title}',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.button,
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
                            )
                          : Text(
                              '${data[index].title}',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.button,
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
      Text('$title', style: Theme.of(context).textTheme.bodyText2),
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
            color: Colors.lightBlueAccent,
          )),
      TextButton(
        child: Text(
          "لا",
          style: Theme.of(context).textTheme.bodyText2,
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
                style: Theme.of(context).textTheme.button,
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
                              Navto(
                                  context,
                                  ZekerTekrar(
                                    tekrar: count,
                                    zeker: zeker,
                                  ));
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
//                                    showSnackBar(context,
//                                        "تم الأضافة إلي الأذكار المفضلة");
                                    Tost(
                                        "تم الأضافة إلي الأذكار المفضلة",
                                        cubit.isDark
                                            ? Colors.lightBlueAccent
                                                .withOpacity(.7)
                                            : Colors.black.withOpacity(.7));
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
                              (value) => Tost(
                                  "تم النسخ في الحافظه",
                                  cubit.isDark
                                      ? Colors.lightBlueAccent.withOpacity(.7)
                                      : Colors.black.withOpacity(.7)));
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

void showSnackBar(context, String text) {
  final snackBar = SnackBar(
      padding: EdgeInsetsDirectional.only(end: 20),
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        textDirection: TextDirection.rtl,
        style: Theme.of(context).textTheme.bodyText1,
      ));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

Widget MesbahaBuilder({
  required counter,
  required context,
  required showAlertMethoud,
  required onGesturedTapMethoud,
}) {
  SizeConfig().init(context);
  return Center(
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        alignment: AlignmentDirectional.centerEnd,
        children: [
          Image.asset(
            'assets/images/home.png',
            height: SizeConfig.safeBlockVertical! * 50,
          ),
          Positioned(
            top: SizeConfig.safeBlockVertical! * 11,
            left: SizeConfig.safeBlockHorizontal! * 43,
            child: Text(
              '$counter',
              style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Positioned(
            top: SizeConfig.safeBlockVertical! * 25.3,
            left: SizeConfig.safeBlockHorizontal! * 60.8,
            child: GestureDetector(
              onTap: () {
                ShowAlertDialog(
                    context: context,
                    title: 'هل تريد البدأ من جديد؟',
                    icon: Icons.warning_outlined,
                    yes: showAlertMethoud);
              },
              child: Container(
                child: CircleAvatar(
                  backgroundColor: HexColor('#2C3138'),
                  radius: 19,
                ),
              ),
            ),
          ),
          Positioned(
            top: SizeConfig.blockSizeVertical! * 32,
            left: SizeConfig.safeBlockHorizontal! * 38,
            child: GestureDetector(
              onTap: onGesturedTapMethoud,
              child: CircleAvatar(
                backgroundColor: HexColor('#2C3138'),
                radius: 32,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void Navto(context, Widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => Widget));
}

Tost(String msg, Color color) {
  return Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.SNACKBAR,
      timeInSecForIosWeb: 5,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}
