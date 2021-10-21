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
          leading: SizedBox(),
          actions: [
            IconButton(
              onPressed: () {

                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
    ):null,
    body: AllZekerPageElemnt(data: doaaData, arbaen: false));
  }
}
