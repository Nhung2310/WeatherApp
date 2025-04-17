import 'package:test_flutter/model/forecast_day.dart';

class Forecast {
  final List<ForecastDay> forecastDay;
  Forecast({required this.forecastDay});

  factory Forecast.fromJson(Map<String, dynamic> json) {
    return Forecast(
      forecastDay:
          (json['forecastday'] as List)
              .map((e) => ForecastDay.fromJson(e))
              .toList(),
    );
  }
}
