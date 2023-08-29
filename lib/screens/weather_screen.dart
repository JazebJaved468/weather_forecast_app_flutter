import 'dart:convert';

import 'dart:ui';

import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:intl/intl.dart';
import 'package:weather_app/constants/secret_api_key.dart';
import 'package:weather_app/widgets/add_info_Item_custom_widget.dart';
import 'package:weather_app/widgets/weather_card_custom_widget.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final textColor = Colors.white;
  late double currentTemp;
  bool isLoading = true;

  // API call
  Future getCurrentWeather() async {
    try {
      String cityName = "Karachi";

      // appID should be stored in .env file which can be hidden by gitignore and even when we wnt to deploy our website

      final result = await http.get(Uri.parse(
          "https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey"));
      final data = jsonDecode(result.body);

      if (data['cod'] != '200') {
        throw '${data['cod']}: An unhandled exception has occured';
      }

      return data;
// data['list'][0]['main']['temp']
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 70,
          title: const Text(
            "Weather App",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: const Icon(Icons.refresh)),
          ],
        ),
        body: FutureBuilder(
          future: getCurrentWeather(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator.adaptive(),
              );
            }
            if (snapshot.hasError) {
              return Center(child: Text(snapshot.error.toString()));
            }

            final data = snapshot.data;

            final currentData = data['list'][0];

            final currentTemp = currentData['main']['temp'];
            final currentSky = currentData['weather'][0]['main'];
            final currentPressure = currentData['main']['pressure'];
            final currentHumidity = currentData['main']['humidity'];
            final currentWindSpeed = currentData['wind']['speed'];

            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                /*loading screen*/
                /*weather page*/
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // MAIN CARD
                  Center(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18)),
                      elevation: 14,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(18),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text(
                                  "$currentTemp K",
                                  style: const TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Icon(
                                  currentSky == "Clouds" || currentSky == "Rain"
                                      ? Icons.cloud
                                      : Icons.sunny,
                                  size: 75,
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                                Text(
                                  "$currentSky",
                                  style: const TextStyle(fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // WEATHER FORECAST CARDS
                  const Text(
                    "Hourly Forecast",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 124,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      // shrinkWrap: true,
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        final forecastData = data['list'][index + 1];

                        final forecastTemp = forecastData['main']['temp'];
                        final datetime = DateTime.parse(forecastData['dt_txt']);
                        final forecastTime = DateFormat.j().format(datetime);
                        final forecastSky = forecastData['weather'][0]['main'];
                        final forecastSkyIcon =
                            forecastSky == "Clouds" || forecastSky == "Rain"
                                ? Icons.cloud
                                : Icons.sunny;

                        return WeatherForecastCard(
                          time: '$forecastTime',
                          temperature: '$forecastTemp',
                          icon: forecastSkyIcon,
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  // Additional Information
                  const Text(
                    "Additional Information",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      AdditionalInforItem(
                        icon: Icons.water_drop,
                        infoLabel: "Humidity",
                        infoValue: "$currentHumidity",
                      ),
                      AdditionalInforItem(
                        icon: Icons.air,
                        infoLabel: "Wind Speed",
                        infoValue: "$currentWindSpeed",
                      ),
                      AdditionalInforItem(
                        icon: Icons.beach_access,
                        infoLabel: "Pressure",
                        infoValue: "$currentPressure",
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
        ));
  }
}
