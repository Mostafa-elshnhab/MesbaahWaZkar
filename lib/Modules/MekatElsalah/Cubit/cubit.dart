import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/Modules/MekatElsalah/Cubit/states.dart';
import 'package:mespaha/data/Api/adanTimeApi.dart';
import 'package:mespaha/models/adanTime.dart';

class AdanCubit extends Cubit<AdanStates> {
  AdanCubit() : super(InitialAdanState());
  static AdanCubit get(context) => BlocProvider.of(context);

  String countryValue = "مصر";
  String stateValue = "";
  String cityValue = "";
  String address = "";
  void ChangeCountry(String value) {
    countryValue = value;
    emit(ChangeCountryState());
  }

  void ChangeState(String value) {
    stateValue = value;
    emit(ChangeStateState());
  }

  void ChangeCity(String value) {
    cityValue = value;
    emit(ChangeCityState());
  }

  AdanModel? adanModel;
  void getAdanData(String city, String country, String state) {
    emit(AdanLodaingState());
    getAdanTime(city, country).then((value) {
      print(value);
      adanModel = AdanModel.fromJSON(value);

      emit(AdanScssesState(adanModel));
      cityValue = city;
      stateValue = state;
      address = country + " , " + city;
    }).catchError((error) {
      print(error.toString());
      emit(AdanErorrState());
    });
  }
}
