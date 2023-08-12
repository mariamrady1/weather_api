import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherm/model/weathermodel.dart';
import 'package:weatherm/provider/weather_provider.dart';
import 'package:weatherm/services/WeatherServices.dart';

class search extends StatefulWidget {
  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {
  String? cityName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Search a City',
        style: TextStyle(fontSize: 20),
      )),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Center(
          child: TextField(
            onChanged: (value) {
              cityName = value;
            },
            onSubmitted: (value) async {
              print('mariam1');
              cityName = value;
              weatherservices services = weatherservices();
              weathermodel? weather =
                  await services.getweather(cityName: cityName!);

              Provider.of<weatherProvider>(context, listen: false).weatherDate =
                  weather;
              Provider.of<weatherProvider>(context, listen: false).cityName =
                  cityName;

              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              label: Text('Search'),
              hintText: 'Enter City  Name',
              suffixIcon: GestureDetector(
                child: Icon(Icons.search),
                onTap: () async {
                  weatherservices services = weatherservices();
                  weathermodel? weather =
                      await services.getweather(cityName: cityName!);

                  Provider.of<weatherProvider>(context, listen: false)
                      .weatherDate = weather;
                  Provider.of<weatherProvider>(context, listen: false)
                      .cityName = cityName;

                  Navigator.pop(context);
                },
              ),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}
