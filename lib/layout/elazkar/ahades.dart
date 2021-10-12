import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mespaha/Shared/components/reusable/reusable%20components.dart';
import 'package:mespaha/data/ahades.dart';

class ahades extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AllZekerPageElemnt(data: ahadesData, arbaen: false);
  }
}
