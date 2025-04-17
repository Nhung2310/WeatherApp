import 'package:test_flutter/model/condition.dart';

class Hour {
  final String time;
  final double tempC;
  final Condition condition;

  Hour({required this.time, required this.tempC, required this.condition});

  factory Hour.fromJson(Map<String, dynamic> json) {
    return Hour(
      time: json['time'],
      tempC: json['temp_c'].toDouble(),
      condition: Condition.fromJson(json['condition']),
    );
  }
}
