import 'package:flutter/material.dart';
import 'package:test_flutter/app_color.dart';

class WeatherHourCard extends StatelessWidget {
  final String temperature;
  final String hour;
  final Widget icon;

  const WeatherHourCard({
    super.key,
    required this.temperature,
    required this.hour,
    required this.icon,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColor.color1, AppColor.color2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            temperature,
            style: const TextStyle(
              color: AppColor.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 8),
          icon,
          const SizedBox(height: 8),
          Text(hour, style: const TextStyle(color: AppColor.white)),
        ],
      ),
    );
  }
}
