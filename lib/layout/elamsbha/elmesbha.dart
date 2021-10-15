import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/States.dart';
import 'package:mespaha/Shared/Cubit/AppCubit/cubit.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';

class elmesbha extends StatelessWidget {
  bool isDrawer = false;
  elmesbha({isDrawer}) {
    this.isDrawer = isDrawer;
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
                MesbahaBuilder(
                    counter: cubit.Counter,
                    context: context,
                    onGesturedTapMethoud: () {
                      cubit.Counter++;
                      cubit.setCounter();
                      print(number.text);
                      if (number.text != '') {
                        if (cubit.Counter == int.parse(number.text)) {
                          showSnackBar(context,
                              'لقد أتممت ${cubit.Counter} من ${zeker.text}');
                        }
                      }
                    },
                    showAlertMethoud: () {
                      cubit.Counter = 0;
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
