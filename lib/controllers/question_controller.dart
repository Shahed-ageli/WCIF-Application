// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:wcif_application/models/qustions_model.dart';
// import 'package:wcif_application/models/user_model.dart';
// import 'package:wcif_application/routes/router.gr.dart';
// import 'package:wcif_application/services/api/data_services.dart';
// import 'package:wcif_application/controllers/user_controller.dart';
// // import 'package:flutter_secure_storage/flutter_secure_storage.dart';
//
//
// class QuestionController extends ChangeNotifier {
//   UserController user;
//
//   //=========================> loadQustions Function
//   int homeState = 0; //0=> Not Load   -    1=> Loded    -   2=> SomeTing Wrong
//   List<QustionsModel> qustionsList;
//   Future<void> loadQustions() async {
//     // final storage = new FlutterSecureStorage();
//     // String myToken = await storage.read(key: "token");
//
//     await Future.delayed(const Duration(seconds: 2));
//     dynamic _resData = await DataApi().getQustionsAPI(user.user.token);
//     if (_resData != null) {
//       qustionsList = _resData.map<QustionsModel>((data) => QustionsModel.fromJson(data)).toList();
//       homeState = 1;
//       notifyListeners();
//     } else {
//       homeState = 2;
//       notifyListeners();
//     }
//   }
//
// //=========================>loadQustions Profile Function
//   int ProfileState = 0;
//   List<QustionsModel> qustionsProfileList;
//   Future<void> loadQustionsProfile() async {
//     await Future.delayed(const Duration(seconds: 2));
//     dynamic _resData = await DataApi().getQustionsReqAPI(user.user.token);
//
//     if (_resData != null) {
//       qustionsProfileList = _resData.map<QustionsModel>((data) => QustionsModel.fromJson(data)).toList();
//       for(int i=0; i< qustionsProfileList.length;i++){
//         if(qustionsProfileList[i].auther!=user.user.loginName){
//           qustionsProfileList.remove(qustionsProfileList[i]);
//         }
//       }
//       ProfileState = 1;
//       notifyListeners();
//     } else {
//       ProfileState = 2;
//       notifyListeners();
//     }
//   }
//
//   //===============> add question
//   final questionTitle = TextEditingController();
//   final questionContent = TextEditingController();
//
//   Future<void> addQuestion() async {
//     print(questionTitle.text);
//     dynamic _resData = await DataApi().AddQustionsAPI(
//       user.user.token,
//       "6",
//       questionTitle.text,
//       questionContent.text,
//     );
//     ExtendedNavigator.root.push(Routes.profileScreen);
//     notifyListeners();
//   }
//
// }