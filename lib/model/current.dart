import 'package:test_flutter/model/condition.dart';

class Current {
  final double tempC;
  final Condition condition;

  Current({required this.tempC, required this.condition});

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      tempC: json['temp_c'].toDouble(),
      condition: Condition.fromJson(json['condition']),
    );
  }
}
