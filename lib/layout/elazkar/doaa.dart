import 'package:flutter/material.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:mespaha/data/doaa.dart';

class doaa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AllZekerPageElemnt(data: doaaData, arbaen: false);
  }
}
