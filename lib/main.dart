import 'package:flutter/material.dart';
import 'ui/weather_app1.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget{
  const WeatherApp({super.key});

@override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: const WeatherApp1(),// gọi màn hình chính
      debugShowCheckedModeBanner: false,
    );
  }

}
