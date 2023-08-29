/*

/// first container

Container(
            padding: EdgeInsets.all(20),
            width: double.infinity,
            margin: EdgeInsets.only(left: 15, right: 15, top: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color.fromARGB(255, 26, 31, 34),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(178, 0, 0, 0),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 0),
                ),
                BoxShadow(
                  color: Color.fromARGB(223, 37, 47, 54),
                  spreadRadius: 4.0,
                  blurRadius: 10,
                  inset: true,
                  // offset: const Offset(0, 0),
                ),
              ],
            ),
            child: const Column(
              children: [
                Text(
                  "300.67\u2109",
                  style: TextStyle(
                    fontSize: 40,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Icon(
                  Icons.cloud,
                  size: 75,
                ),
                Text(
                  "Rain",
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
          ),


°F = \u2109

for (int i=1; i<6; i++){
                          final String forecastData= snapshot.data['list'][i];
                          final String forecastTemp = forecastData['main']['temp'];
                          final String forecastTime = forecastData['dt_txt'];
                          final String forecastSky= forecastData['weather']['main'];
                          final IconData forecastSkyIcon= forecastSky == "Clouds" || forecastSky == "Rain" ? Icons.cloud : Icons.sunny;

                          
                          WeatherForecastCard(time: forecastTime, temperature: forecastTemp, icon: forecastSkyIcon)
                        },


             for (int i=1; i<6; i++){
                          final forecastData= snapshot.data['list'][i];
                          final forecastTemp = snapshot.data['list'][i]['main']['temp'];
                          final forecastTime = snapshot.data['list'][i]['dt_txt'];
                          final forecastSky = snapshot.data['list'][i]['weather']['main'];
                          final IconData forecastSkyIcon= snapshot.data['list'][i]['weather'][0]['main'] == "Clouds" || snapshot.data['list'][i]['weather'][0]['main'] == "Rain" ? Icons.cloud : Icons.sunny;

                          
                          WeatherForecastCard(time: forecastTime, temperature: forecastTemp, icon: forecastSkyIcon)
                        }, 


              SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        for (int i = 1; i < snapshot.data['cnt']; i++) ...[
                          WeatherForecastCard(
                            time: "${snapshot.data['list'][i]['dt_txt'][4]}",
                            temperature:
                                "${snapshot.data['list'][i]['main']['temp']}",
                            icon: snapshot.data['list'][i]['weather'][0]
                                            ['main'] ==
                                        "Clouds" ||
                                    snapshot.data['list'][i]['weather'][0]
                                            ['main'] ==
                                        "Rain"
                                ? Icons.cloud
                                : Icons.sunny,
                          ),
                        ],
                      ],
                    ),
                  ),          
 */