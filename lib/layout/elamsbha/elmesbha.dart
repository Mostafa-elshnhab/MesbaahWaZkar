import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:shared_preferences/shared_preferences.dart';

int Counter = 0;

class elmesbha extends StatefulWidget {
  @override
  _elmesbhaState createState() => _elmesbhaState();
}

class _elmesbhaState extends State<elmesbha> {
  @override
  void setCounter() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('counter', Counter);
  }

  var zeker = TextEditingController();
  var number = TextEditingController();
  bool showCursol = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsetsDirectional.only(top: 10.0, end: 10, start: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    child: TextFormField(
                      textDirection: TextDirection.rtl,
                      autofocus: false,
                      controller: zeker,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'NotoKufi'),
                      decoration: InputDecoration(
                        hintText: 'الذكر ',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: TextFormField(
                      textDirection: TextDirection.rtl,
                      controller: number,
//
//                      onEditingComplete: () {
//                        setState(() {
//                          showCursol = false;
//                        });
//                      },
                      keyboardType: TextInputType.number,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          height: 1.2,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'NotoKufi'),
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.lightBlueAccent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        hintText: 'التكرار ',
                        hintTextDirection: TextDirection.rtl,
                        hintStyle: TextStyle(
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
                                '$Counter',
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
                                  Counter++;
                                  setCounter();
                                  print(number.text);
                                  if (number.text != '') {
                                    if (Counter == int.parse(number.text)) {
                                      showSnackBar(context,
                                          'لقد أتممت $Counter من ${zeker.text}');
                                    }
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

//                  SizedBox(
//                    height: 120,
//                  ),
                    ],
                  ),
//              Column(
//                children: [
//                  SizedBox(
//                    height: 37,
//                  ),

//              Column(
//                children: [
////                  SizedBox(
////                    height: 150,
////                  ),
//
//                ],
//              ),
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
                  Counter = 0;
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
