import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../view/about_us_screen.dart';
import '../view/add-edit_question_screen.dart';
import '../view/categories_screen.dart';
import '../view/category_questions_screen.dart';
import '../view/follower_screen.dart';
import '../view/following_screen.dart';
import '../view/home_screen.dart';
import '../view/login_screen.dart';
import '../view/menu_screen.dart';
import '../view/notification_screen.dart';
import '../view/profile.dart';
import '../view/profile_edit_screen.dart';
import '../view/question_category_screen.dart';
import '../view/question_details_screen.dart';
import '../view/question_search_results.dart';
import '../view/select_interest_screen.dart';
import '../view/setting_screen.dart';
import '../view/signup_screen.dart';
import '../view/user_answers_screen.dart';
import '../view/user_search_results.dart';
import '../view/welcome_screen.dart';

import '../widgets/alert/alert_dialog_1.dart';
import '../widgets/alert/alert_dialog_2.dart';
import '../widgets/alert/alert_dialog_3.dart';
import '../widgets/alert/bottom_sheet_1.dart';
import '../widgets/alert/bottom_sheet_2.dart';
import '../widgets/alert/bottom_sheet_3.dart';
import '../widgets/alert/bottom_sheet_4.dart';

class Routes {
  static const String welcomeScreen = '/';
  static const String aboutUsScreen = '/aboutUsScreen';
  static const String addEditQuestionScreen = '/add-edit-question-screen';
  static const String alertDialog1 = '/alert-dialog1';
  static const String alertDialog2 = '/alert-dialog2';
  static const String alertDialog3 = '/alert-dialog3';
  static const String bottomSheet1 = '/bottom-sheet1';
  static const String bottomSheet2 = '/bottom-sheet2';
  static const String bottomSheet3 = '/bottom-sheet3';
  static const String bottomSheet4 = '/bottom-sheet4';
  static const String followerScreen = '/follower-screen';
  static const String followingScreen = '/following-screen';
  static const String categoryQuestionsScreen = '/category-questions-screen';
  static const String questionCategoryScreen = '/question-category-screen';
  static const String questionSearchResultsScreen = '/question-search-results-screen';
  static const String loginScreen = '/login-screen';
  static const String notificationScreen = '/notification_screen';
  static const String profileScreen = '/profile-screen';
  static const String profileEditScreen = '/profile-edit-screen';
  static const String selectInterestScreen = '/select-interest-screen';
  static const String settingScreen = '/setting-screen';
  static const String signUpScreen = '/sign-up-screen';
  static const String userAnswersScreen = '/user-answers-screen';
  static const String userSearchResultsScreen = '/user-search-results-screen';
  static const String homeScreen = '/home-screen';
  static const String questionDetailsScreen = '/questionDetails-screen';
  static const String categoriesScreen = '/categories-screen';
  static const String menuScreen = '/menu-screen';



  static const all = <String>{
    aboutUsScreen,
    addEditQuestionScreen,
    alertDialog1,
    alertDialog2,
    alertDialog3,
    bottomSheet1,
    bottomSheet2,
    bottomSheet3,
    bottomSheet4,
    followerScreen,
    followingScreen,
    categoryQuestionsScreen,
    questionCategoryScreen,
    questionSearchResultsScreen,
    loginScreen,
    notificationScreen,
    welcomeScreen,
    profileScreen,
    profileEditScreen,
    selectInterestScreen,
    settingScreen,
    signUpScreen,
    userAnswersScreen,
    userSearchResultsScreen,
    homeScreen,
    questionDetailsScreen,
    categoriesScreen,
    menuScreen,
  };
}

class AppRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[

    RouteDef(Routes.aboutUsScreen, page: AboutUsScreen),
    RouteDef(Routes.addEditQuestionScreen, page: AddEditQuestionScreen),
    RouteDef(Routes.alertDialog1, page: AlertDialog1),
    RouteDef(Routes.alertDialog2, page: AlertDialog2),
    RouteDef(Routes.alertDialog3, page: AlertDialog3),
    RouteDef(Routes.bottomSheet1, page: BottomSheet1),
    RouteDef(Routes.bottomSheet2, page: BottomSheet2),
    RouteDef(Routes.bottomSheet3, page: BottomSheet3),
    RouteDef(Routes.bottomSheet4, page: BottomSheet4),
    RouteDef(Routes.followerScreen, page: FollowerScreen),
    RouteDef(Routes.followingScreen, page: FollowingScreen),
    RouteDef(Routes.categoryQuestionsScreen, page: CategoryQuestionsScreen),
    RouteDef(Routes.questionCategoryScreen, page: QuestionCategoryScreen),
    RouteDef(Routes.questionSearchResultsScreen, page: QuestionSearchResultsScreen),
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.notificationScreen, page: NotificationScreen),
    RouteDef(Routes.welcomeScreen, page: WelcomeScreen),
    RouteDef(Routes.profileScreen, page: ProfileScreen),
    RouteDef(Routes.profileEditScreen, page: ProfileEditScreen),
    RouteDef(Routes.selectInterestScreen, page: SelectInterestScreen),
    RouteDef(Routes.settingScreen, page: SettingScreen),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.userAnswersScreen, page: UserAnswersScreen),
    RouteDef(Routes.userSearchResultsScreen, page: UserSearchResultsScreen),
    RouteDef(Routes.homeScreen, page: HomeScreen),
    RouteDef(Routes.questionDetailsScreen, page: QuestionDetailsScreen),
    RouteDef(Routes.categoriesScreen, page: CategoriesScreen),
    RouteDef(Routes.menuScreen, page: MenuScreen),

  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{

    AboutUsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AboutUsScreen(),
        settings: data,
      );
    },

    AddEditQuestionScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AddEditQuestionScreen(),
        settings: data,
      );
    },

    AlertDialog1: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AlertDialog1(),
        settings: data,
      );
    },
    AlertDialog2: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AlertDialog2(),
        settings: data,
      );
    },
    AlertDialog3: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AlertDialog3(),
        settings: data,
      );
    },

    BottomSheet1: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => BottomSheet1(),
        settings: data,
      );
    },
    BottomSheet2: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => BottomSheet2(),
        settings: data,
      );
    },
    BottomSheet3: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => BottomSheet3(),
        settings: data,
      );
    },
    BottomSheet4: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => BottomSheet4(),
        settings: data,
      );
    },

    FollowerScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FollowerScreen(),
        settings: data,
      );
    },

    FollowingScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => FollowingScreen(),
        settings: data,
      );
    },

    CategoryQuestionsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CategoryQuestionsScreen(),
        settings: data,
      );
    },


    QuestionCategoryScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => QuestionCategoryScreen(),
        settings: data,
      );
    },

    QuestionSearchResultsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => QuestionSearchResultsScreen(),
        settings: data,
      );
    },


    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },

    NotificationScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => NotificationScreen(),
        settings: data,
      );
    },

    WelcomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => WelcomeScreen(),
        settings: data,
      );
    },

    ProfileScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileScreen(),
        settings: data,
      );
    },

    ProfileEditScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => ProfileEditScreen(),
        settings: data,
      );
    },

    SelectInterestScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SelectInterestScreen(),
        settings: data,
      );
    },

    SettingScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingScreen(),
        settings: data,
      );
    },

    SignUpScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpScreen(),
        settings: data,
      );
    },

    UserAnswersScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserAnswersScreen(),
        settings: data,
      );
    },

    UserSearchResultsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => UserSearchResultsScreen(),
        settings: data,
      );
    },


    SelectInterestScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SelectInterestScreen(),
        settings: data,
      );
    },

    SignUpScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpScreen(),
        settings: data,
      );
    },

    HomeScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => HomeScreen(),
        settings: data,
      );
    },

    QuestionDetailsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => QuestionDetailsScreen(),
        settings: data,
      );
    },

    CategoriesScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CategoriesScreen(),
        settings: data,
      );
    },

    MenuScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => MenuScreen(),
        settings: data,
      );
    },

  };
}
