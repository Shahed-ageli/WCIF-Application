// import 'package:flutter/material.dart';
// import 'package:wcif_application/models/category_model.dart';
// import 'package:wcif_application/models/user_model.dart';
// import 'package:wcif_application/services/api/data_services.dart';
//
//
// class CategoryController extends ChangeNotifier {
//
//   UserModel user;
//
// //=========================> loadCategory function
//   int CategortState = 0;
//   List<CategoryModel> categoryList;
//
//   Future<void> loadCategory() async {
//     await Future.delayed(const Duration(seconds: 2));
//     dynamic _resData = await DataApi().GetCategoryAPI(user.token);
//     if (_resData != null) {
//       categoryList =
//           _resData.map<CategoryModel>((data) => CategoryModel.fromJson(data))
//               .toList();
//       CategortState = 1;
//       notifyListeners();
//     } else {
//       CategortState = 2;
//       notifyListeners();
//     }
//   }
// }