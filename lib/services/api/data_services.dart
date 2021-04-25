import 'dart:convert';

import 'package:http/http.dart' as http;

class DataApi {
  String baseUrl = "https://wcif-backend.herokuapp.com/api/";
  // String baseUrl = "https://wcif-backend.herokuapp.com/api/";

  // Login API
  Future<dynamic> loginAPI(String email, String password) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + 'auth/login'),
          body: {'Email': email, 'Password': password});

      var jsonData = json.decode(response.body);
      if (jsonData['message'] == "login successfull." && jsonData['user']['UserType']!=0 ) {
        print("welcome User");
        return jsonData;
      } else if(jsonData['user']['UserType']==0){
        print("your admin login on dashbord");
      } else{
        print("wrong login");
        return null;
      }
    } on Exception catch (_) {
      print("error");
      print(_);
      return null;
    }
  }

  // Register API
  Future<dynamic> registerAPI(String firstName, String lastName, String loginName, String email, String password,String phone) async {
    try {
      var response = await http.post(Uri.parse(baseUrl + 'auth/registration'),
          body: {
            'FirstName': firstName,
            'LastName': lastName,
            'LoginName': loginName,
            'Email': email,
            'Password': password,
            'Phone': phone,
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
      print("error Register");
      print(_);
      return null;
    }
  }
// Get Qustions API
  Future<dynamic> getQustionsAPI(String token) async {
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

  // Get ProfileQustions API
  Future<dynamic> getQustionsReqAPI(String token) async {
    try {
      var headers = {
        "Authorization": token,
      };
      var data =
      await http.get(Uri.parse(baseUrl + 'question/getRequest'), headers: headers);
      print(data.statusCode);
      if (data.statusCode == 200) {
        return json.decode(data.body);
      }
    } on Exception catch (_) {
      return null;
    }
  }

  // Add Qustions API
  Future<dynamic> AddQustionsAPI(String token,String categoryId,String title, String content) async {
    try {
      var headers = {
        "Authorization": token,
      };
      var response = await http.post(Uri.parse(baseUrl + 'question/add'),headers: headers,
          body: {
          'CategoryId':"6",
          'QuestionTitle': title,
          'QuestionContent': content,
            //'QuestionImage':null,
          },
      );

      print(response.statusCode);

      // var jsonData = json.decode(response.body);
      // print(jsonData);
      // if ([jsonData['rowsAffected']].length == 1) {
      //   print("added");
      //   return jsonData;
      // } else {
      //   print(jsonData);
      //   return null;
      // }
    } on Exception catch (_) {
      print(_);
      print("error");
      return null;
    }
  }

  // Get Category API
  Future<dynamic> GetCategoryAPI(String token) async {
    try {
      var headers = {
        "Authorization": token,
      };
      var data =
      await http.get(Uri.parse(baseUrl + 'category/get'), headers: headers);
      print(data.statusCode);
      if (data.statusCode == 200) {
        return json.decode(data.body);
      }
    } on Exception catch (_) {
      return null;
    }
  }
//  End Data API
}