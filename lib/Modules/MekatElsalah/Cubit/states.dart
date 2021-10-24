import 'package:mespaha/models/adanTime.dart';

abstract class AdanStates {}

class InitialAdanState extends AdanStates {}

class ChangeCountryState extends AdanStates {}

class ChangeStateState extends AdanStates {}

class ChangeCityState extends AdanStates {}

class AdanLodaingState extends AdanStates {}

class AdanScssesState extends AdanStates {
  final AdanModel? adanModel;

  AdanScssesState(this.adanModel);
}

class AdanErorrState extends AdanStates {}
