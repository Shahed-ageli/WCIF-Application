import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wcif_application/models/category_model.dart';
import 'package:wcif_application/models/qustions_model.dart';
import 'package:wcif_application/models/user_model.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/services/api/data_services.dart';

class UserController extends ChangeNotifier {
  UserModel userCatch;
  UserModel user;

  //
  //
  //
  //=========================> Login Function
  final emailIn = TextEditingController();
  final passwordIn = TextEditingController();
  Future<UserModel> login() async {
    print(emailIn.text);
    print(passwordIn.text);
    dynamic _resData = await DataApi().loginAPI(emailIn.text, passwordIn.text);
    if (_resData != null) {
      user = UserModel.fromJson(_resData);
      ExtendedNavigator.root.push(Routes.homeScreen);
      return user;
    }
    notifyListeners();

  }

  //
  //
  //
  //=========================> Register Function
  final firstNameRg = TextEditingController();
  final lastNameRg = TextEditingController();
  final loginNameRg = TextEditingController();
  final emailRg = TextEditingController();
  final phoneRg = TextEditingController();
  final passwordRg = TextEditingController();
  Future<void> register() async {
    print(emailIn.text);
    dynamic _resData = await DataApi().registerAPI(
        firstNameRg.text,
        lastNameRg.text,
        loginNameRg.text,
        emailRg.text,
        passwordRg.text,
        phoneRg.text);
    if (_resData != null) {
      //var FName=_resData['user']['FirstName'];
      ExtendedNavigator.root.push(Routes.selectInterestScreen);
    }
    notifyListeners();
  }

  //=========================> Register Function
  int homeState = 0; //0=> Not Load   -    1=> Loded    -   2=> SomeTing Wrong
  List<QustionsModel> qustionsList;
  Future<void> loadQustions() async {
    await Future.delayed(const Duration(seconds: 2));
    dynamic _resData = await DataApi().getQustionsAPI(user.token);
    if (_resData != null) {
      qustionsList = _resData.map<QustionsModel>((data) => QustionsModel.fromJson(data)).toList();
      homeState = 1;
      notifyListeners();
    } else {
      homeState = 2;
      notifyListeners();
    }
  }

//=========================>
  int ProfileState = 0;
  List<QustionsModel> qustionsProfileList;
  Future<void> loadQustionsProfile() async {
    await Future.delayed(const Duration(seconds: 2));
    dynamic _resData = await DataApi().getQustionsReqAPI(user.token);

    if (_resData != null) {
      qustionsProfileList = _resData.map<QustionsModel>((data) => QustionsModel.fromJson(data)).toList();
      for(int i=0; i< qustionsProfileList.length;i++){
        if(qustionsProfileList[i].auther!=user.loginName){
          qustionsProfileList.remove(qustionsProfileList[i]);
        }
      }
      ProfileState = 1;
      notifyListeners();
    } else {
      ProfileState = 2;
      notifyListeners();
    }
  }


  //=========================>
  int CategortState = 0;
  List<CategoryModel> categoryList;
  Future<void> loadCategory() async {
    await Future.delayed(const Duration(seconds: 2));
    dynamic _resData = await DataApi().GetCategoryAPI(user.token);
    if (_resData != null) {
      categoryList = _resData.map<CategoryModel>((data) => CategoryModel.fromJson(data)).toList();
      CategortState = 1;
      notifyListeners();
    } else {
      CategortState = 2;
      notifyListeners();
    }
  }


  //===============> add question
  final questionTitle = TextEditingController();
  final questionContent = TextEditingController();

  Future<void> addQuestion() async {
    print(questionTitle.text);
    dynamic _resData = await DataApi().AddQustionsAPI(
      user.token,
      "6",
      questionTitle.text,
      questionContent.text,
    );
    //if (_resData != null) {
      ExtendedNavigator.root.push(Routes.profileScreen);
    //}
    notifyListeners();
  }

}
