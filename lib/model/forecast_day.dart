import 'package:test_flutter/model/Day.dart';
import 'package:test_flutter/model/Hour.dart';

class ForecastDay {
  final Day day;
  final List<Hour> hour;

  ForecastDay({required this.day, required this.hour});

  factory ForecastDay.fromJson(Map<String, dynamic> json) {
    return ForecastDay(
      day: Day.fromJson(json['day']),
      hour: (json['hour'] as List).map((e) => Hour.fromJson(e)).toList(),
    );
  }
}
