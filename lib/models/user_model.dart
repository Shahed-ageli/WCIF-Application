class UserModel {
  final String token;
  final int id;
  final String phone;
  final String name;


  UserModel({this.token, this.id, this.phone, this.name});

  factory UserModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return UserModel(
      token: jsonData['token'],
      id:jsonData['id'],
      phone: jsonData['phone'],
      name: jsonData['name'],
    );
  }
}

