class FollowModel {
  final int UserId;
  final String firstName;
  final String lastName;
  final String loginName;
  final String email;

  FollowModel({ this.UserId, this.firstName,this.lastName,this.loginName, this.email});

  factory FollowModel.fromJson(Map<dynamic, dynamic> jsonData) {
    return FollowModel(
      UserId:int.parse(jsonData['UserId']),
      firstName: jsonData['FirstName'],
      lastName: jsonData['LastName'],
      loginName: jsonData['LoginName'],
      email: jsonData['Email'],
    );
  }
}