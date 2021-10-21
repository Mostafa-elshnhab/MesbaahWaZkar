import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:mespaha/data/ahades.dart';

class ahades extends StatelessWidget {
  bool isDrawer = false;
  ahades({isdrawer}) {
    this.isDrawer = isdrawer;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isDrawer
            ? AppBar(
                title: Text(
                  'هدي نبوي',
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
        body: AllZekerPageElemnt(data: ahadesData, arbaen: false));
  }
}
