import 'package:flutter/material.dart';

class WeatherForecastCard extends StatelessWidget {
  final String time;
  final String temperature;
  final IconData icon;

  const WeatherForecastCard(
      {super.key,
      required this.time,
      required this.temperature,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      // margin: EdgeInsets.zero,
      child: Container(
        // width: 100,
        padding: const EdgeInsets.symmetric(
          horizontal: 26,
          vertical: 12,
        ),
        child: Column(
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(
              height: 8,
            ),
            Icon(
              icon,
              size: 34,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              temperature,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
