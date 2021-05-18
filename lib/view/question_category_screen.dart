import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/custom_button_1.dart';
import 'package:wcif_application/widgets/shared/pill.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/values/values.dart';
import 'file:///C:/Users/ielsh/AndroidStudioProjects/wcif_application/lib/widgets/layout/auto_load.dart';

class QuestionCategoryScreen extends StatefulWidget {
  @override
  _QuestionCategoryScreenState createState() => _QuestionCategoryScreenState();
}

class _QuestionCategoryScreenState extends State<QuestionCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);
    return AutoLoad(
      onInit: () async {
        await user.getCategory();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
          child: CustomAppBar(
            hasTrailing: false,
            hasTitle: true,
            title: StringConst.QUESTION_CATEGORIES,
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: Sizes.PADDING_24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                StringConst.WHAT_CATEGORY,
                style: theme.textTheme.headline4,
              ),
              SpaceH16(),
              Text(
                StringConst.CHOOSE_CATEGORY,
                style: theme.textTheme.headline6,
              ),
              SpaceH16(),
              user.CategortState == 0 ?
              Column(
                  children: [
                    Text(
                      StringConst.INLOAD,
                      style: theme.textTheme.bodyText1.copyWith(
                        color: AppColors.blackFull,
                        fontSize: Sizes.SIZE_20,
                      ),
                    ),
                    Image.asset(ImagePath.LOAD)
                  ]
              )
                  : user.CategortState == 1 ?
              Wrap(
                spacing: Sizes.SIZE_8,
                runSpacing: Sizes.SIZE_6,
                alignment: WrapAlignment.start,
                children: user.categoryList.map((item) =>
                    Pill(
                      title: item.CategoryName,
                      isSelected: false,
                    ),).toList().cast<Widget>(),
              )
                  : user.CategortState == 2 ?
              Container(
                child: Text(
                  StringConst.PROBLEM_IN_LOAD,
                  style: theme.textTheme.bodyText1.copyWith(
                    color: AppColors.blackFull,
                    fontSize: Sizes.SIZE_20,
                  ),
                ),
              )
                  : Container(),
              SpaceH12(),
              CustomButton(
                onPressed: () {
                  ExtendedNavigator.root.push(
                      Routes.addQuestionScreen,
                      arguments: "");
                },
                height: Sizes.HEIGHT_60,
                borderRadiusGeometry: AppRadius.defaultButtonRadius,
                title: StringConst.DONE,
                color: AppColors.greenblue2,
                textStyle: theme.textTheme.subtitle1.copyWith(
                  color: AppColors.white,
                ),
              ),
              SpaceH16(),
              CustomButton(
                onPressed: () {
                  ExtendedNavigator.root.pop();
                },
                height: Sizes.HEIGHT_60,
                borderSide: Borders.defaultButtonBorder,
                borderRadiusGeometry: AppRadius.defaultButtonRadius,
                title: StringConst.CANCEL,
                color: AppColors.white,
                textStyle: theme.textTheme.subtitle1.copyWith(
                  color: AppColors.grey2,
                ),
              ),
              SpaceH12(),
            ],
          ),
        ),
      ),
    );
  }
}