// import 'package:http/http.dart' as http;

// class weatherservices {
//   Future<void> getweather({required String cityname}) async {
//     Uri uri = Uri.parse(
//         'http://api.weatherapi.com/v1/current.json?key=4bc0cd92abe84cf29da193603230407&q=London&aqi=no');
//    http.Response response =await http.get(uri);
//   }
// }
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weatherm/model/weathermodel.dart';

class weatherservices {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apikey = '4bc0cd92abe84cf29da193603230407';

  Future<weathermodel?> getweather({required String cityName}) async {
    weathermodel? weather;
    try {
      Uri uri =
          Uri.parse('$baseUrl/forecast.json?key=$apikey&q=$cityName&day=1');
      http.Response response = await http.get(uri); //date...post update delete
      print(response.body);
      Map<String, dynamic> date = jsonDecode(response.body);
      weather = weathermodel.jsonform(date);
    } catch (e) {
      print('mariamfalse');
      print(e.toString());
    }
    return weather;
  }
}
