import 'package:flutter/material.dart';
import 'package:test_flutter/app_assets.dart';
import 'package:test_flutter/app_color.dart';
import 'package:test_flutter/ui/weather_app3.dart';
import 'package:test_flutter/ui/weather_card.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:test_flutter/location_service.dart';

import 'package:dio/dio.dart';
import 'package:test_flutter/model/weather_model.dart';

class WeatherApp2 extends StatefulWidget {
  const WeatherApp2({super.key});

  @override
  State<WeatherApp2> createState() => _WeatherApp2State();
}

class _WeatherApp2State extends State<WeatherApp2> {
  WeatherModel? weatherData;

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
                          children:
                              weatherData == null
                                  ? [TextSpan(text: 'Loading ...')]
                                  : [
                                    TextSpan(
                                      text:
                                          '${weatherData!.current.tempC.round()}\n',
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          '${weatherData!.current.condition.text}\n',
                                      style: const TextStyle(fontSize: 20),
                                    ),
                                    TextSpan(
                                      text:
                                          'Max: ${weatherData!.forecast.forecastDay[0].day.maxTempC.round()} '
                                          'Min: ${weatherData!.forecast.forecastDay[0].day.minTempC.round()}',
                                      style: const TextStyle(fontSize: 20),
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
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 45,
                left: 0,
                right: 0,
                child: WeatherCard(weatherData: weatherData),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getLocation();
    });
  }

  void getLocation() async {
    try {
      final position = await LocationService.getCurrentLocation();
      final address = await LocationService.getAddressFromPosition(position);

      print(
        'ChangNhung nè hihi Lat: ${position.latitude}, Lng: ${position.longitude}',
      );
      print(' Địa chỉ: $address');

      fetchWeather(position.latitude, position.longitude);
    } catch (e) {
      print('❌ Lỗi lấy vị trí hoặc địa chỉ: $e');
    }
  }

  void fetchWeather(double lat, double lon) async {
    try {
      final dio = Dio();
      const apiKey = '14f15a5d38894172b0f73339251404';

      final respone = await dio.get(
        'https://api.weatherapi.com/v1/forecast.json',
        queryParameters: {'key': apiKey, 'q': '$lat,$lon', 'days': 1},
      );

      setState(() {
        weatherData = WeatherModel.fromJson(respone.data);
      });

      print("Liu liu:${weatherData!.current.tempC}");
    } catch (e) {
      print("Lỗi kìa liu liu: $e");
    }
  }
}
