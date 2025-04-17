class Day {
  final double maxTempC;
  final double minTempC;

  Day({required this.maxTempC, required this.minTempC});

  factory Day.fromJson(Map<String, dynamic> json) {
    return Day(
      maxTempC: json['maxtemp_c'].toDouble(),
      minTempC: json['mintemp_c'].toDouble(),
    );
  }
}
