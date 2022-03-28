class User {
  final int id;
  final String name;
  final String image;
  final String email;

  User(
      {required this.id,
      required this.image,
      required this.name,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      image: json['image'].toString(),
      name: json['name'],
      email: json['email'],
    );
  }
}
