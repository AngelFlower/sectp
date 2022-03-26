class Temperature {
  final int fishTankId;
  final String dateTime;
  final double temperature;

  const Temperature({
    required this.fishTankId,
    required this.dateTime,
    required this.temperature,
  });

  factory Temperature.fromJson(Map<String, dynamic> json) {
    return Temperature(
      fishTankId: 1, //json['fish_tank_id'],
      dateTime: json['date_time'],
      temperature: double.parse(json['temperature']),
    );
  }
}
