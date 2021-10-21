import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:mespaha/data/Alarbaen.dart';

class Alarbaen extends StatelessWidget {
  bool isDrawer = false;
  Alarbaen({isdrawer}) {
    this.isDrawer = isdrawer;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isDrawer
            ? AppBar(
                title: Text(
                  'الأربعين النووية',
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
        body: AllZekerPageElemnt(data: alarbaenData, arbaen: true));
  }
}
