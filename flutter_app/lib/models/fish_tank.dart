class FishTank {
  final String id;
  final String name;
  final String image;
  final String minTemperature;
  final String maxTemperature;
  final String capacity;
  final String latestTemperature;
  final String status;
  final String userId;

  const FishTank({
    required this.id,
    required this.name,
    required this.image,
    required this.minTemperature,
    required this.maxTemperature,
    required this.capacity,
    required this.latestTemperature,
    required this.status,
    required this.userId,
  });

  factory FishTank.fromJson(Map<String, dynamic> json) {
    if (json['image'] == null || json['image'] == '') {
      json['image'] = 'https://i.imgur.com/m6z37oM.png';
    }
    return FishTank(
        id: json['id'].toString(),
        name: json['name'].toString(),
        image: json['image'].toString(),
        minTemperature: json['min_temperature'].toString(),
        maxTemperature: json['max_temperature'].toString(),
        capacity: json['capacity'].toString(),
        latestTemperature: json['latest_temperature'].toString(),
        status: json['status'].toString(),
        userId: json['user_id'].toString());
  }
}
