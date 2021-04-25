class UserModel {
  final String token;
  final int id;
  final String phone;
  final String firstName;
  final String lastName;
  final String loginName;
  final String email;

  UserModel({this.token, this.id, this.phone, this.firstName,this.lastName,this.loginName, this.email});

  factory UserModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return UserModel(
      token: jsonData['token'],
      id:int.parse(jsonData['user']['Id']),
      phone: jsonData['user']['Phone'],
      firstName: jsonData['user']['FirstName'],
      lastName: jsonData['user']['LastName'],
      loginName: jsonData['user']['LoginName'],
      email: jsonData['user']['Email'],
    );
  }
}
