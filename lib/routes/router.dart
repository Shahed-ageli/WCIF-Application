import 'package:auto_route/auto_route_annotations.dart';

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

@MaterialAutoRouter(
  routes: <AutoRoute>[
    MaterialRoute(page: MenuScreen),
    MaterialRoute(page: AboutUsScreen),
    MaterialRoute(page: AddEditQuestionScreen),
    MaterialRoute(page: AlertDialog1),
    MaterialRoute(page: AlertDialog2),
    MaterialRoute(page: AlertDialog3),
    MaterialRoute(page: BottomSheet1),
    MaterialRoute(page: BottomSheet2),
    MaterialRoute(page: BottomSheet3),
    MaterialRoute(page: BottomSheet4),
    MaterialRoute(page: FollowerScreen),
    MaterialRoute(page: FollowingScreen),
    MaterialRoute(page: CategoryQuestionsScreen),
    MaterialRoute(page: QuestionDetailsScreen),
    MaterialRoute(page: QuestionCategoryScreen),
    MaterialRoute(page: QuestionSearchResultsScreen),
    MaterialRoute(page: LoginScreen),
    MaterialRoute(page: NotificationScreen),
    MaterialRoute(page: WelcomeScreen, initial: true),
    MaterialRoute(page: ProfileScreen),
    MaterialRoute(page: ProfileEditScreen),
    MaterialRoute(page: SelectInterestScreen),
    MaterialRoute(page: SettingScreen),
    MaterialRoute(page: SignUpScreen),
    MaterialRoute(page: UserAnswersScreen),
    MaterialRoute(page: UserSearchResultsScreen),
    MaterialRoute(page: HomeScreen),
    MaterialRoute(page: CategoriesScreen),

  ],
)
class $AppRouter {}