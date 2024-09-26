class UserModel {
  final String fullName, email, password, phoneNumber, country, city;

  const UserModel({
    required this.fullName,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.country,
    required this.city,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      fullName: json["fullName"],
      email: json["email"],
      password: json["password"],
      phoneNumber: json["phoneNumber"],
      country: json["country"],
      city: json["city"],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "fullName": fullName,
      "email": email,
      "password": password,
      "phoneNumber": phoneNumber,
      "country": country,
      "city": city,
    };
  }
}
