import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/models/category_model.dart';
import 'package:wcif_application/models/follow_model.dart';
import 'package:wcif_application/models/qustions_model.dart';
import 'package:wcif_application/models/user_model.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/services/api/data_services.dart';

class UserController extends ChangeNotifier {
  UserModel userCatch;
  UserModel user;
  //=========================> Login
  final emailIn = TextEditingController();
  final passwordIn = TextEditingController();
  Future<UserModel> login() async {
    print(emailIn.text);
    print(passwordIn.text);
    dynamic _resData = await DataApi().login(emailIn.text, passwordIn.text);
    if (_resData != null) {
      user = UserModel.fromJson(_resData);
      ExtendedNavigator.root.push(Routes.homeScreen);
      return user;
    }
    notifyListeners();
  }

  //=========================> Register
  final firstNameRg = TextEditingController();
  final lastNameRg = TextEditingController();
  final loginNameRg = TextEditingController();
  final emailRg = TextEditingController();
  final phoneRg = TextEditingController();
  final passwordRg = TextEditingController();
  Future<void> registration() async {
    print(emailIn.text);
    dynamic _resData = await DataApi().registration(
        firstNameRg.text,
        lastNameRg.text,
        loginNameRg.text,
        emailRg.text,
        passwordRg.text,
        phoneRg.text
    );
    if (_resData != null) {
      ExtendedNavigator.root.push(Routes.selectInterestScreen);
    }
    notifyListeners();
  }

  //=========================> get Qustions
  int homeState = 0; //0=> Not Load   -    1=> Loded    -   2=> SomeTing Wrong
  List<QustionsModel> qustionsList;
  Future<void> getQustions() async {
    await Future.delayed(const Duration(seconds: 2));
    dynamic _resData = await DataApi().getQustions(user.token);
    if (_resData != null) {
      qustionsList = _resData.map<QustionsModel>((data) => QustionsModel.fromJson(data)).toList();
      homeState = 1;
      notifyListeners();
    } else {
      homeState = 2;
      notifyListeners();
    }
  }

//=========================>get User Questions
  int ProfileState = 0;
  List<QustionsModel> qustionsProfileList;
  Future<void> getUserQuestions(int id) async {
    await Future.delayed(const Duration(seconds: 2));
    dynamic _resData = await DataApi().getUserQuestions(user.token,id );
    if (_resData != null) {
      qustionsProfileList = _resData.map<QustionsModel>((data) => QustionsModel.fromJson(data)).toList();
      ProfileState = 1;
      notifyListeners();
    } else {
      ProfileState = 2;
      notifyListeners();
    }
  }

  //===============> add question
  final questionTitle = TextEditingController();
  final questionContent = TextEditingController();
  Future<void> addQuestion() async {
    dynamic _resData = await DataApi().addQustion(
      user.token,
      questionTitle.text,
      questionContent.text,
    );
    print(_resData);
    print(":_resData");
    if (_resData != null) {
      ExtendedNavigator.root.pop();
      ExtendedNavigator.root.pop();
    }
    notifyListeners();
  }

//=========================> get Category
  int CategortState = 0;
  List<CategoryModel> categoryList;

  Future<void> getCategory() async {
    await Future.delayed(const Duration(seconds: 2));
    dynamic _resData = await DataApi().getCategory(user.token);
    if (_resData != null) {
      categoryList = _resData.map<CategoryModel>((data) => CategoryModel.fromJson(data)).toList();
      CategortState = 1;
      notifyListeners();
    } else {
      CategortState = 2;
      notifyListeners();
    }
  }

  //==================> get Followings
  int Followings=0;
  List<FollowModel> followingsList;
  Future<void> getFollowings() async{
    await Future.delayed(const Duration(seconds: 2));
    dynamic _resData = await DataApi().getFollowimgs(user.token);
    if(_resData != null){
      followingsList=_resData.map<FollowModel>((data)=> FollowModel.fromJson(data)).toList();
      Followings=1;
      notifyListeners();
    }else{
      Followings=2;
      notifyListeners();
    }
  }

  //==================> get Followers
  int Followers=0;
  List<FollowModel> followersList;
  Future<void> getFollowers() async{
    await Future.delayed(const Duration(seconds: 2));
    dynamic _resData = await DataApi().getFollowers(user.token);
    if(_resData != null){
      followersList=_resData.map<FollowModel>((data)=> FollowModel.fromJson(data)).toList();
      Followers=1;
      notifyListeners();
    }else{
      Followers=2;
      notifyListeners();
    }
  }

  //===============> follow user
  Future<void> followUser(String userId) async{
    dynamic _resData = await DataApi().followUser(user.token, userId);
    if(_resData!=null){
      print(" تم متابعة المستخدم  ");
    }else{
      print("لم يتم متابعة المستخدم حدث خطا");
    }
  }

  //===============> unFollow user
  Future<void> unFollowUser(String userId) async{
    dynamic _resData = await DataApi().unFollowUser(user.token, userId);
    if(_resData!=null){
      print(" تم إلغاء متابعة المستخدم  ");
    }else{
      print("لم يتم إلغاء متابعة المستخدم حدث خطا");
    }
  }
}
