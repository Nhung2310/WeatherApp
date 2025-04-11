import 'package:flutter/material.dart';
import 'package:test_flutter/app_assets.dart';
import 'package:test_flutter/app_color.dart';
import 'weather_hour_card.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColor.color1, AppColor.color2],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(30),
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // 🟪 Dòng Today | July 21
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Today",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "July, 21",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ⬇️ 4 card thời tiết ngang
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              WeatherHourCard(
                temperature: '19°C',
                hour: '15.00',
                iconAsset: AppAssets.icCloudRain,
              ),
              WeatherHourCard(
                temperature: '18°C',
                hour: '16.00',
                iconAsset: AppAssets.icCloudRain,
              ),
              WeatherHourCard(
                temperature: '18°C',
                hour: '17.00',
                iconAsset: AppAssets.icCloudRain,
              ),
              WeatherHourCard(
                temperature: '18°C',
                hour: '18.00',
                iconAsset: AppAssets.icCloudRain,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
