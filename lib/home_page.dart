import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherm/model/weathermodel.dart';
import 'package:weatherm/provider/weather_provider.dart';
import 'package:weatherm/search.dart';
import 'package:weatherm/services/WeatherServices.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  weathermodel? weatherDate;
//   weatherservices weatherserive = weatherservices();
//   bool isloading = false;
//   getdate() async {
//     setState(() {
//       isloading = true;
//     });
//     weatherDate = await weatherserive.getweather();
//  setState(() {
//       isloading = false;
//     });
//   }

  // @override
  // void initState() {
  //   getdate();

  //   super.initState();
  // }

  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    weatherDate =
        Provider.of<weatherProvider>(context, listen: true).weatherDate;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return search();
                }));
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: weatherDate == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather😔start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherDate!.getColor(),
                weatherDate!.getColor()[300]!,
                weatherDate!.getColor()[100]!,
              ])),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Spacer(
                      flex: 3,
                    ),
                    Text(Provider.of<weatherProvider>(context).cityName!,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Text(
                      'Updated at: ${ weatherDate!.date.hour.toString()}:${weatherDate!.date.minute.toString()} ',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(weatherDate!.getImage()),
                        Text(
                          weatherDate!.temp.toInt().toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Column(
                          children: [
                            Text(
                              'maxTemp:${weatherDate!.tempmax.toInt()}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'minTemp:${weatherDate!.tempmin.toInt()} ',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    Spacer(),
                    Text(
                      weatherDate!.stateWeather,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Spacer(
                      flex: 6,
                    ),
                  ]),
            ),
    );
  }
}
