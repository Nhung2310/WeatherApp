import 'package:flutter/material.dart';
import 'package:test_flutter/app_assets.dart';
import 'package:test_flutter/app_color.dart';
import 'weather_hour_card.dart';

class WeatherHour extends StatefulWidget {
  const WeatherHour({super.key});

  @override
  State<WeatherHour> createState() => _WeatherHourState();
}

class _WeatherHourState extends State<WeatherHour> {
  final ScrollController _scrollController = ScrollController();
  final List<Map<String, String>> hours = [
    {'temp': '12°C', 'hour': '15.00'},
    {'temp': '13°C', 'hour': '16.00'},
    {'temp': '14°C', 'hour': '17.00'},
    {'temp': '15°C', 'hour': '18.00'},
    {'temp': '16°C', 'hour': '19.00'},
    {'temp': '17°C', 'hour': '20.00'},
  ];
  void scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 80 * 2,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeOut,
    );
  }

  void scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 80 * 2,
      duration: const Duration(microseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      height: 130,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: AppColor.white),
            onPressed: scrollLeft,
          ),
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: hours.length,
              itemBuilder: (context, index) {
                final data = hours[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: WeatherHourCard(
                    temperature: data['temp']!,
                    hour: data['hour']!,
                    iconAsset: AppAssets.icCloudRain,
                  ),
                );
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.arrow_forward_ios, color: AppColor.white),
            onPressed: scrollRight,
          ),
        ],
      ),
    );
  }
}

// class WeatherHour extends StatelessWidget {
//   const WeatherHour({super.key});

//   @override
//   Widget build(BuildContext context) {
    
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
        
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: const [
//             WeatherHourCard(
//               temperature: '19°C',
//               hour: '15.00',
//               iconAsset: AppAssets.icCloudRain,
//             ),
//             WeatherHourCard(
//               temperature: '18°C',
//               hour: '16.00',
//               iconAsset: AppAssets.icCloudRain,
//             ),
//             WeatherHourCard(
//               temperature: '18°C',
//               hour: '17.00',
//               iconAsset: AppAssets.icCloudRain,
//             ),
//             WeatherHourCard(
//               temperature: '18°C',
//               hour: '18.00',
//               iconAsset: AppAssets.icCloudRain,
//             ),
//              WeatherHourCard(
//               temperature: '18°C',
//               hour: '17.00',
//               iconAsset: AppAssets.icCloudRain,
//             ),
//             WeatherHourCard(
//               temperature: '18°C',
//               hour: '18.00',
//               iconAsset: AppAssets.icCloudRain,
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }
