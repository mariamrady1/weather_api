import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class weathermodel {
  DateTime date;
  double temp;
  double tempmax;
  double tempmin;
  String stateWeather;
  weathermodel(
      {required this.date,
      required this.temp,
      required this.tempmax,
      required this.tempmin,
      required this.stateWeather});
  factory weathermodel.jsonform(dynamic date) {
    var jsondate = date['forecast']['forecastday'][0]['day'];
    //DateTime dateTime = DateTime.parse(date['location']['localtime']);
    String dateString = '${date['location']['localtime']}';
    DateFormat inputFormat = DateFormat('yyyy-MM-dd h:mm');
    DateTime dateTime = inputFormat.parse(dateString);
    return weathermodel(
        date: dateTime,
        temp: jsondate['avgtemp_c'],
        tempmax: jsondate['maxtemp_c'],
        tempmin: jsondate['mintemp_c'],
        stateWeather: jsondate['condition']['text']);
  }

  String getImage() {
    if (stateWeather == 'Clear' || stateWeather == 'Light Cloud') {
      return 'assets/images/clear.png';
    } else if (stateWeather == 'Snow' ||
        stateWeather == 'Hail' ||
        stateWeather == 'Sleet') {
      return 'assets/images/snow.png';
    } else if (stateWeather == 'Heavy Cloud') {
      return 'assets/images/cloudy.png';
    } else if (stateWeather == 'Light Rain' ||
        stateWeather == 'Heavy Rain' ||
        stateWeather == 'Showers' ||
        stateWeather == 'Patchy rain possible') {
      return 'assets/images/rainy.png';
    } else if (stateWeather == 'Thunderstorm' || stateWeather == 'Thunder') {
      return 'assets/images/thunderstorm.png';
    } else {
      return 'assets/images/clear.png';
    }
  }

  MaterialColor getColor() {
    if (stateWeather == 'Clear' || stateWeather == 'Light Cloud') {
      return Colors.orange;
    } else if (stateWeather == 'Snow' ||
        stateWeather == 'Hail' ||
        stateWeather == 'Sleet') {
      return Colors.blue;
    } else if (stateWeather == 'Heavy Cloud') {
      return Colors.blueGrey;
    } else if (stateWeather == 'Light Rain' ||
        stateWeather == 'Heavy Rain' ||
        stateWeather == 'Showers' ||
        stateWeather == 'Patchy rain possible') {
      return Colors.blue;
    } else if (stateWeather == 'Thunderstorm' || stateWeather == 'Thunder') {
      return Colors.deepPurple;
    } else {
      return Colors.orange;
    }
  }
}
