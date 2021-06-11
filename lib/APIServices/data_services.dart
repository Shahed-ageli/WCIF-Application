import 'dart:convert';
import 'package:http/http.dart' as http;

class DataApi {
  String baseUrl = "https://wcif-backend.herokuapp.com/api/";
  // Login
  Future<dynamic> login(String email, String password) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + 'auth/login'),
          body: {'Email': email, 'Password': password}
          );
      if(response.statusCode==200){
        var jsonData = json.decode(response.body);
        if (jsonData['message'] == "login successfull.") {
          return jsonData;
        }
      }
    } on Exception catch (_) {
      print(_);
      return null;
    }
  }
  // Register
  Future<dynamic> registration(String firstName, String lastName, String loginName, String email, String password,String phone) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + 'auth/registration'),
          body: {
            'FirstName': firstName,
            'LastName': lastName,
            'LoginName': loginName,
            'Email': email,
            'Password': password,
            'Phone': phone,
            // 'UserType': "0",
          });
      var jsonData = json.decode(response.body);
      if ([jsonData['rowsAffected']].length == 1) {
        print("Success Registerd");
        return jsonData;
      } else {
        print("wrong");
        return null;
      }
    } on Exception catch (_) {
      return null;
    }
  }
// Get Qustions
  Future<dynamic> getQustions(String token) async {
    try {
      var headers = {
        "Authorization": token,
      };
      var data =
      await http.get(Uri.parse(baseUrl + 'question/get'), headers: headers);
      print(data.statusCode);
      if (data.statusCode == 200) {
        return json.decode(data.body);
      }
    } on Exception catch (_) {
      return null;
    }
  }
  // Get Profile Qustions
  Future<dynamic> getUserQuestions(String token,int id) async {
    try {
      var headers = {"Authorization": token,"Content-Type": "application/json"};
      var body = jsonEncode({"UserId": id.toString()});
      final encoding = Encoding.getByName('utf-8');
      var data = await http.post(Uri.parse(baseUrl + 'user/getUserQuestions'),
          headers: headers,
          body: body,
          encoding: encoding,
      );
      print(data.statusCode);
      if (data.statusCode == 200) {
        print(data.statusCode);
        return json.decode(data.body);
      }
    } on Exception catch (_) {
      return null;
    }
  }
  // Add Qustions
  Future<dynamic> addQustion(String token,String title, String content) async {
    try {
      var headers = {"Authorization": token,"Content-Type": "application/json"};
      var body = jsonEncode({
        'CategoryId':"6",
        'QuestionTitle': title,
        'QuestionContent': content,
        'QuestionImage':null,
      });
      final encoding = Encoding.getByName('utf-8');
      var response = await http.post(Uri.parse(baseUrl + 'question/add'),
        headers: headers,
        body: body,
        encoding: encoding,
      );
      print(response.statusCode);
    } on Exception catch (_) {
      return null;
    }
  }
  // Get Category
  Future<dynamic> getCategory(String token) async {
    try {
      var headers = {"Authorization": token,};
      var data = await http.get(Uri.parse(baseUrl + 'category/get'), headers: headers);
      print(data.statusCode);
      if (data.statusCode == 200) {
        return json.decode(data.body);
      }
    } on Exception catch (_) {
      return null;
    }
  }
  // get Followings
  Future<dynamic> getFollowimgs(String token) async{
      try{
        var headers = {"Authorization": token,};
        var data = await http.get(Uri.parse(baseUrl + 'user/getFollowings'),headers: headers);
        if (data.statusCode == 200) {
          return json.decode(data.body);
        }
      }on Exception catch (_) {
        return null;
      }
  }
  // get Followers
  Future<dynamic> getFollowers(String token) async{
    try{
      var headers = {"Authorization": token,};
      var data = await http.get(Uri.parse(baseUrl + 'user/getFollowers'),headers: headers);
      if (data.statusCode == 200) {
        return json.decode(data.body);
      }
    }on Exception catch (_) {
      return null;
    }
  }
  // follow user
  Future<dynamic> followUser(String token, String userId) async{
    try{
      var headers = {"Authorization": token,"Content-Type": "application/json"};
      var body = jsonEncode({"Id": userId.toString()});
      final encoding = Encoding.getByName('utf-8');
      var data = await http.post(
        Uri.parse(baseUrl + 'user/followUser'),
        headers: headers,
        body: body,
        encoding: encoding,
      );
      if (data.statusCode == 200) {
        return json.decode(data.body);
      }
    }on Exception catch (_) {
      return null;
    }
  }
  // Unfollow user
  Future<dynamic> unFollowUser(String token, String userId) async{
    try{
      var headers = {"Authorization": token,"Content-Type": "application/json"};
      var body = jsonEncode({"Id": userId.toString()});
      final encoding = Encoding.getByName('utf-8');
      var data = await http.post(
        Uri.parse(baseUrl + 'user/unFollowUser'),
        headers: headers,
        body: body,
        encoding: encoding,
      );
      if (data.statusCode == 200) {
        return json.decode(data.body);
      }
    }on Exception catch (_) {
      return null;
    }
  }
}