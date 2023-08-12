import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherm/provider/weather_provider.dart';

import 'home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return weatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<weatherProvider>(context).weatherDate == null
            ? Colors.blue
            : Provider.of<weatherProvider>(context).weatherDate!.getColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
