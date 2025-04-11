import 'package:flutter/material.dart';
import 'package:test_flutter/app_color.dart';

class MiniCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String mainText;
  final String subText;
  const MiniCard({
    super.key,
    required this.icon,
    required this.title,
    required this.mainText,
    required this.subText,
  });
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColor.white),
        gradient: const LinearGradient(
          colors: [AppColor.color1, AppColor.color2],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 16, color: AppColor.white),
              const SizedBox(width: 6),
              Text(
                title,
                style: const TextStyle(color: AppColor.white, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            mainText,
            style: const TextStyle(
              color: AppColor.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subText,
            style: const TextStyle(color: AppColor.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
