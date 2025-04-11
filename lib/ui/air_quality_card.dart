import 'package:flutter/material.dart';
import 'package:test_flutter/app_color.dart';

class AirQualityCard extends StatelessWidget {
  const AirQualityCard({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [AppColor.color1, AppColor.color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(Icons.my_location, color: AppColor.white, size: 18),
              SizedBox(width: 6),
              Text(
                'AIR QUALITY',
                style: TextStyle(color: AppColor.white, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            '3-Low Health Risk',
            style: TextStyle(
              color: AppColor.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'See more',
                style: TextStyle(color: AppColor.white, fontSize: 13),
              ),
              Icon(Icons.chevron_right, color: AppColor.white, size: 20),
            ],
          ),
        ],
      ),
    );
  }
}
