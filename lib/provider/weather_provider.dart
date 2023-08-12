import 'package:flutter/material.dart';
import 'package:weatherm/model/weathermodel.dart';

class weatherProvider extends ChangeNotifier {
  weathermodel? _weatherDate;
  String? cityName;
  set weatherDate(weathermodel? weather) {
    _weatherDate = weather;
    notifyListeners();
  }

  weathermodel? get weatherDate => _weatherDate;
}
