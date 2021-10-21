import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/States.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/cubit.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';

int Counter = 0;
int zekrTekrar = 0;
String Zeker = '';

class elmesbha extends StatelessWidget {
  bool isDrawer = false;
  elmesbha({isDrawer}) {
    this.isDrawer = isDrawer;
//    zeker.text = Zeker;
//    number.text = zekrTekrar.toString();
  }
  var zeker = TextEditingController();
  var number = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);
        return Scaffold(
          appBar: isDrawer
              ? AppBar(
                  title: Text(
                    'تسبيح وذكر',
                  ),
                  centerTitle: true,
                  leadingWidth: 0,
            leading: SizedBox(),
            actions: [
              IconButton(
                onPressed: () {

                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_forward_ios_outlined),
              ),
            ],
                )
              : null,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsetsDirectional.only(
                      top: 10.0, end: 10, start: 10),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: TextFormField(
                            textDirection: TextDirection.rtl,
                            autofocus: false,
                            controller: zeker,
                            style: Theme.of(context).textTheme.bodyText2,
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
                                  color: cubit.isDark
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                              hintTextDirection: TextDirection.rtl,
                              hintStyle: TextStyle(
                                color: Colors.grey,
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
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.bodyText2,
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
                                  color: cubit.isDark
                                      ? Colors.white
                                      : Colors.black,
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
                MesbahaBuilder(
                    counter: Counter,
                    context: context,
                    onGesturedTapMethoud: () {
                      Counter++;
                      if (zeker.value.isComposingRangeValid &&
                          number.value.isComposingRangeValid) {
                        zekrTekrar = int.parse(number.text);
                        Zeker = zeker.text;
                      }
                      cubit.setCounter();
                      if (number.text != '') {
                        try {
                          if (Counter == int.parse(number.text)) {
                            Vibrate.vibrate();
                            showSnackBar(context,
                                'لقد أتممت ${Counter} من ${zeker.text}');
                          }
                        } catch (e) {
                          showSnackBar(
                              context, 'تاكد من أن التكرار عباره عن رقم فقط');
                        }
                      }
                    },
                    showAlertMethoud: () {
                      Counter = 0;
                      cubit.setCounter();
                      Navigator.of(context).pop();
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
