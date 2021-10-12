import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

String? comingZeker = null;
String? ComingTekrar = null;

class ZekerTekrar extends StatefulWidget {
  @override
  _ZekerTekrarState createState() => _ZekerTekrarState();

  ZekerTekrar({String? zeker, String? tekrar}) {
    comingZeker = zeker;
    ComingTekrar = tekrar;
  }
}

class _ZekerTekrarState extends State<ZekerTekrar> {
  int Counter3 = 0;
  bool showCursol = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(
                        top: 10.0, end: 10, start: 10),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage("assets/images/zakharef.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Center(
                        child: SelectableText(
                          '$comingZeker',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'NotoKufi'),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Stack(
                        alignment: AlignmentDirectional.centerEnd,
                        children: [
                          Image.asset('assets/images/home.png'),
                          Column(
                            children: [
                              Row(
                                children: [
//                      SizedBox(
//                        width: 90,
//                      ),
                                  Expanded(
                                    child: Container(
                                      alignment: AlignmentDirectional.center,
//                          width: 160,
//                          height: 70,
                                      padding:
                                          EdgeInsetsDirectional.only(top: 20),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        '$Counter3',
                                        style: TextStyle(
                                            fontSize: 40,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
//                      SizedBox(
//                        width: 220,
//                      ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        showAlertDialog(context);
                                      },
                                      child: Container(
                                        padding: EdgeInsetsDirectional.only(
                                            top: 43, end: 85),
                                        alignment:
                                            AlignmentDirectional.centerEnd,
                                        child: CircleAvatar(
                                          backgroundColor: HexColor('#2C3138'),
                                          radius: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
//                      SizedBox(
//                        width: 135,
//                      ),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Counter3++;

                                          print(ComingTekrar);
                                          if (Counter3 ==
                                              int.parse(ComingTekrar!)) {
                                            showSnackBar(context,
                                                'لقد أتممت $Counter3 من ${comingZeker}');
                                            Counter3 = 0;
                                          }
                                        });
                                      },
                                      child: CircleAvatar(
                                        backgroundColor: HexColor('#2C3138'),
                                        radius: 32,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage("assets/images/zakharef.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Center(
                      child: SelectableText(
                        'التكرار: $ComingTekrar ',
                        textDirection: TextDirection.rtl,
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'NotoKufi'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
        title: Column(
      children: [
        Icon(
          Icons.warning_outlined,
          color: Colors.red,
          size: 60,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          'هل تريد البدأ من جديد؟',
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
              onPressed: () {
                setState(() {
                  Counter3 = 0;
                  Navigator.of(context).pop();
                });
              },
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
            setState(() {
              Navigator.of(context).pop();
            });
          },
        )
      ],
    ));

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
        backgroundColor: Colors.black.withOpacity(.7),
        padding: EdgeInsetsDirectional.only(end: 20),
        behavior: SnackBarBehavior.floating,
        content: Text(
          text,
          textDirection: TextDirection.rtl,
          style: TextStyle(
              fontSize: 16, color: Colors.white, fontFamily: 'NotoKufi'),
        ));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
