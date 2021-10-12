import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

int Counter2 = 0;
int countZeker = 0;

class khetamElsalah extends StatefulWidget {
  @override
  _khetamElsalahState createState() => _khetamElsalahState();
}

class _khetamElsalahState extends State<khetamElsalah> {
  void setCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter2', Counter2);
    prefs.setInt('countZeker', countZeker);
  }

  List<String> zekerTitele = [
    'سُبْحَانَ اللَّه',
    'الْحَمْدُ للّهِ',
    'اللَّهُ أَكْبَرُ',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Container(
              width: 300,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  zekerTitele[countZeker],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                              padding: EdgeInsetsDirectional.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                '$Counter2',
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
                                alignment: AlignmentDirectional.centerEnd,
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
                                  Counter2++;
                                  if (Counter2 == 33) {
                                    if (countZeker == 2) {
                                      countZeker = 0;
                                    } else {
                                      countZeker = countZeker + 1;
                                    }
                                    Counter2 = 0;
                                  }
                                  setCounter();
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

//                  SizedBox(
//                    height: 120,
//                  ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
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
                  Counter2 = 0;
                  countZeker = 0;
                  setCounter();
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
}
