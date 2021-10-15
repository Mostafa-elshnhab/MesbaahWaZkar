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
              )
            : null,
        body: AllZekerPageElemnt(data: ahadesData, arbaen: false));
  }
}
