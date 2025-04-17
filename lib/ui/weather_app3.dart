import 'package:flutter/material.dart';
import 'package:test_flutter/app_color.dart';
import 'package:test_flutter/ui/air_quality_card.dart';
import 'package:test_flutter/ui/mini_card.dart';
import 'package:test_flutter/ui/weather_hour.dart';

class WeatherApp3 extends StatefulWidget {
  const WeatherApp3({super.key});
  @override
  State<WeatherApp3> createState() => _WeatherApp3State();
}

class _WeatherApp3State extends State<WeatherApp3> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.color1, AppColor.color2],
            begin: Alignment.center,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),
              Expanded(
                flex: 1,
                child: Center(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: const TextStyle(color: AppColor.white),
                      children: const [
                        TextSpan(
                          text: 'North America\n Max: 24°   Min:18°\n',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,

                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '7-Days Forecasts',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColor.white,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const WeatherHour(),
                  ],
                ),
              ),
              Expanded(flex: 2, child: AirQualityCard()),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      MiniCard(
                        icon: Icons.wb_sunny_outlined,
                        title: 'SUNRISE',
                        mainText: "5:28 AM",
                        subText: "Sunset: 7.25 PM",
                      ),
                      MiniCard(
                        icon: Icons.wb_sunny,
                        title: 'UV INDEX',
                        mainText: '4',
                        subText: "Moderate",
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: Icon(Icons.menu, color: AppColor.white, size: 34),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
