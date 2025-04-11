import 'package:flutter/material.dart';
import 'package:test_flutter/app_assets.dart';
import 'package:test_flutter/app_color.dart';
import 'package:test_flutter/ui/weather_app3.dart';
import 'package:test_flutter/ui/weather_card.dart';

class WeatherApp2 extends StatefulWidget {
  const WeatherApp2({super.key});

  @override
  State<WeatherApp2> createState() => _WeatherApp2State();
}

class _WeatherApp2State extends State<WeatherApp2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColor.color1, AppColor.color2],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      child: Image.asset(
                        AppAssets.icCloudRain,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: const TextStyle(color: AppColor.white),
                          children: const [
                            TextSpan(
                              text: '19\n',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: 'VietNam\n',
                              style: TextStyle(fontSize: 20),
                            ),
                            TextSpan(
                              text: 'Max: 24  Min:18',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: SizedBox(
                      child: Image.asset(
                        AppAssets.icWinterHouseChristmas,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const WeatherApp3(),
                                ),
                              );
                            },
                            child: const Icon(
                              Icons.location_on,
                              color: AppColor.white,
                              size: 28,
                            ),
                          ),
                          const Icon(
                            Icons.add_circle,
                            color: AppColor.white,
                            size: 34,
                          ),
                          const Icon(
                            Icons.menu,
                            color: AppColor.white,
                            size: 28,
                          ),
                        ],
                      ),
                      // children: const [
                      //   Icon(
                      //     Icons.location_on,
                      //     color: AppColor.white,
                      //     size: 28,
                      //   ),
                      //   Icon(Icons.add_circle, color: AppColor.white, size: 34),
                      //   Icon(Icons.menu, color: AppColor.white, size: 28),
                      // ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 45,
                left: 0,
                right: 0,
                child: const WeatherCard(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
