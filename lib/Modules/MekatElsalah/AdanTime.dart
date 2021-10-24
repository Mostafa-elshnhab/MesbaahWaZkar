import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mespaha/models/adanTime.dart';

import 'Cubit/cubit.dart';
import 'Cubit/states.dart';

class AdanTime extends StatelessWidget {
  String? fajr;
  String? Sunrise;
  String? Dhuhr;
  String? Asr;
  String? Sunset;
  String? Maghrib;
  String? Isha;
  String? readable;
  String? day;
  String? month;
  String? year;
  String? weekday;
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AdanCubit()..getAdanData('طنطا', 'مصر', 'الغربية'),
      child: BlocConsumer<AdanCubit, AdanStates>(
        listener: (context, state) {
          if (state is AdanScssesState) {
            fajr = state.adanModel!.data!.timings!.Fajr;
            Sunrise = state.adanModel!.data!.timings!.Sunrise;
            Dhuhr = state.adanModel!.data!.timings!.Dhuhr;
            Asr = state.adanModel!.data!.timings!.Asr;
            Sunset = state.adanModel!.data!.timings!.Fajr;
            Maghrib = state.adanModel!.data!.timings!.Fajr;
            Isha = state.adanModel!.data!.timings!.Fajr;
            readable = state.adanModel!.data!.date!.readable;
            day = state.adanModel!.data!.date!.hijri!.day;
            weekday = state.adanModel!.data!.date!.hijri!.weekday;
            month = state.adanModel!.data!.date!.hijri!.month;
            year = state.adanModel!.data!.date!.hijri!.year;
            int minute = DateTime.now().minute;
            int hour = DateTime.now().hour;
//                DateTime(DateTime.now().minute, DateTime.now().hour);
            print(minute);
            print(hour);
          }
        },
        builder: (context, state) {
          AdanModel? adanModel;
          AdanCubit cubit = AdanCubit.get(context);
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: AppBar(
                title: Text('مواقيت الصلاة'),
              ),
              body: (state is! AdanLodaingState)
                  ? SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              height: 130,
                              child: Column(
                                children: [
                                  CSCPicker(
                                    flagState:
                                        CountryFlag.SHOW_IN_DROP_DOWN_ONLY,
                                    showStates: true,
                                    showCities: true,
                                    cityDropdownLabel: 'المدينة',
                                    stateDropdownLabel: 'المحافظة',
                                    defaultCountry: DefaultCountry.Egypt,
                                    disableCountry: true,
                                    currentCountry: cubit.countryValue,
                                    currentState: cubit.stateValue,
                                    currentCity: cubit.cityValue,
                                    dropdownItemStyle:
                                        Theme.of(context).textTheme.bodyText2,
                                    selectedItemStyle:
                                        Theme.of(context).textTheme.button,
                                    dropdownHeadingStyle:
                                        Theme.of(context).textTheme.button,
                                    onCountryChanged: (value) {
                                      cubit.ChangeCountry(value);
                                    },
                                    onStateChanged: (value) {
                                      cubit.ChangeState('$value');
                                    },
                                    onCityChanged: (value) {
                                      cubit.ChangeCity('$value');
                                      count++;
                                      if (count == 3 &&
                                          cubit.countryValue == 'مصر') {
                                        cubit.getAdanData('${cubit.cityValue}',
                                            "مصر", "${cubit.stateValue}");
                                        count = 0;
                                      }
//                                      else if (count == 4) {
//                                        cubit.getAdanData(
//                                            '${cubit.cityValue}',
//                                            "${cubit.countryValue}",
//                                            "${cubit.stateValue}");
//                                        count = 0;
//                                      }
                                    },
                                  ),
                                ],
                              )),
                          Center(
                              child: Text(
                            '${cubit.address}',
                            style: Theme.of(context).textTheme.bodyText2,
                          )),
                          Center(
                              child: Text(
                            '$weekday  $day  $month  $year ',
                            style: Theme.of(context).textTheme.bodyText2,
                          )),
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/zakharef.jpg"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text(
                                          'الصلاة',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button!
                                              .copyWith(
                                                  color: Colors.lightBlue),
                                        )),
                                        Expanded(
                                            child: Text(
                                          'الوقت',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button!
                                              .copyWith(
                                                  color: Colors.lightBlue),
                                        )),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                      endIndent: 5,
                                      indent: 5,
                                      height: 5,
                                      thickness: 1,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('الفجر',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button)),
                                        Expanded(
                                            child: Text(
                                          '$fajr',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                        )),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                      endIndent: 5,
                                      indent: 5,
                                      height: 5,
                                      thickness: 1,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('الشروق',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button)),
                                        Expanded(
                                            child: Text(
                                          '$Sunrise',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                        )),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                      endIndent: 5,
                                      indent: 5,
                                      height: 5,
                                      thickness: 1,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('الظهر',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button)),
                                        Expanded(
                                            child: Text(
                                          '$Dhuhr',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                        )),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                      endIndent: 5,
                                      indent: 5,
                                      height: 5,
                                      thickness: 1,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('العصر',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button)),
                                        Expanded(
                                            child: Text(
                                          '$Asr',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                        )),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                      endIndent: 5,
                                      indent: 5,
                                      height: 5,
                                      thickness: 1,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('الغروب',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button)),
                                        Expanded(
                                            child: Text(
                                          '$Sunset',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                        )),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                      endIndent: 5,
                                      indent: 5,
                                      height: 5,
                                      thickness: 1,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('المغرب',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button)),
                                        Expanded(
                                            child: Text(
                                          '$Maghrib',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                        )),
                                      ],
                                    ),
                                    Divider(
                                      color: Colors.grey.shade500,
                                      endIndent: 5,
                                      indent: 5,
                                      height: 5,
                                      thickness: 1,
                                    ),
                                    Row(
                                      children: [
                                        Expanded(
                                            child: Text('العشاء',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .button)),
                                        Expanded(
                                            child: Text(
                                          '$Isha',
                                          style: Theme.of(context)
                                              .textTheme
                                              .button,
                                        )),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          );
        },
      ),
    );
  }
}
