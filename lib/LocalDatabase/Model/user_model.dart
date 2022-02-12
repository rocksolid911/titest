class UserModel {
  int? id;
  late String email;
  late String password;
  late String name;
  late int phone;

  UserModel({
    this.id,
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
  });

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        email: json["name"],
        password: json["address"],
        name: json["gender"],
        phone: json["education"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": email,
        "address": password,
        "gender": name,
        "education": phone,
      };
}
