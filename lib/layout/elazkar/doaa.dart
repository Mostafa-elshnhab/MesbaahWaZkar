import 'package:flutter/material.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:mespaha/data/doaa.dart';

class doaa extends StatelessWidget {
  bool isDrawer=false;
  doaa({isdrawer})
  {
    this.isDrawer=isdrawer;
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar:isDrawer? AppBar(
        title: Text(
        'أدعية',
    ),
    centerTitle: true,
    leadingWidth: 0,
    ):null,
    body: AllZekerPageElemnt(data: doaaData, arbaen: false));
  }
}
