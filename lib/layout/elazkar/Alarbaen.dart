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
              )
            : null,
        body: AllZekerPageElemnt(data: alarbaenData, arbaen: true));
  }
}
