import 'package:flutter/material.dart';
import 'package:weather_app/screens/weather_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
        title: 'Weather Forecast',
        home: const WeatherScreen(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(useMaterial3: true)
        // .copyWith(
        //     appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
        //   ),
        );
  }
}
