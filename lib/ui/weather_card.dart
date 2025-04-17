import 'package:flutter/material.dart';
import 'package:test_flutter/app_color.dart';
import 'package:test_flutter/model/weather_model.dart';
import 'weather_hour_card.dart';

class WeatherCard extends StatelessWidget {
  final WeatherModel? weatherData;
  const WeatherCard({super.key, this.weatherData});

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
          // 🟪 Dòng Today | July 21 \\ callapi nè
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Today",
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                getFormattedDate(),
                style: TextStyle(
                  color: AppColor.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // ⬇️ 4 card thời tiết ngang\\ cũng call api trong 4 tiếng tiếp theo
          weatherData == null
              ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  return const WeatherHourCard(
                    temperature: '--°C',
                    hour: '--:--',
                    icon: Icon(Icons.cloud, color: Colors.white),
                  );
                }),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(4, (index) {
                  final hourData =
                      weatherData!.forecast.forecastDay[0].hour[index + 14];
                  return WeatherHourCard(
                    temperature: '${hourData.tempC.round()}°C',
                    hour: hourData.time.split(' ').last.substring(0, 5),
                    icon: Image.network('https:${hourData.condition.icon}'),
                  );
                }),
              ),
        ],
      ),
    );
  }

  String getFormattedDate() {
    final now = DateTime.now();
    final month = _getMonthName(now.month);
    final day = now.day;
    return '$month, $day';
  }

  String _getMonthName(int month) {
    const months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December',
    ];
    return months[month - 1];
  }
}
