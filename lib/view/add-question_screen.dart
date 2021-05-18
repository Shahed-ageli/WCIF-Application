import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_text_form_field_2.dart';
import 'package:wcif_application/widgets/shared/pill.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'file:///C:/Users/ielsh/AndroidStudioProjects/wcif_application/lib/widgets/layout/auto_load.dart';
import 'package:wcif_application/widgets/shared/vertical_text.dart';

class AddQuestionScreen extends StatefulWidget {
  @override
  _AddQuestionScreenState createState() => _AddQuestionScreenState();
}

class _AddQuestionScreenState extends State<AddQuestionScreen> {
  @override
  Widget build(BuildContext context) {
    final String args = ModalRoute.of(context).settings.arguments;
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);
    TextStyle titleStyle = theme.textTheme.subtitle1.copyWith(
      color: AppColors.bluegreen,
      fontWeight: FontWeight.bold,
      fontSize: Sizes.TEXT_SIZE_18,
    );
    return AutoLoad(
      onInit: () async {
        await user.getCategory();
      },
      child: Scaffold(
        body: Container(
          child: ListView(
            children: [
              SpaceH12(),
              Center(
                 child: Text(
                   StringConst.ADD_QUESTION,
                   style: theme.textTheme.headline5.copyWith(
                     color: AppColors.greenblue,
                     fontSize: Sizes.TEXT_SIZE_28,
                   ),
                 ),
               ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SpaceH8(),
                    CustomTextFormField(
                      controller: user.questionTitle,
                      hasTitle: true,
                      fieldTitle:  StringConst.QUESTIONTITEL + ":",
                      fieldTitleTextStyle:titleStyle ,
                      maxLines: 1,
                      textFormFieldStyle: theme.textTheme.subtitle1.copyWith(
                        color: AppColors.blackFull,
                      ),
                      prefixIconColor: AppColors.greenblue2,
                      hintTextStyle: theme.textTheme.bodyText2.copyWith(
                        color: AppColors.grey,
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                      borderStyle: BorderStyle.solid,
                    ),
                    SpaceH8(),
                    CustomTextFormField(
                      hasTitle: true,
                      fieldTitle: StringConst.QUESTION_DESCREPTION + ":",
                      fieldTitleTextStyle:titleStyle ,
                      controller: user.questionContent,
                      maxLines: 5,
                      textFormFieldStyle: theme.textTheme.subtitle1.copyWith(
                        color: AppColors.blackFull,
                      ),
                      prefixIconColor: AppColors.greenblue2,
                      hintTextStyle: theme.textTheme.bodyText2.copyWith(
                        color: AppColors.grey,
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                      borderStyle: BorderStyle.solid,
                    ),
                    SpaceH8(),
                    Row(
                        children: [
                          Text(
                            StringConst.QUESTION_CATEGORIES +" : ",
                            style: titleStyle,
                          ),
                          Pill(
                            title: args == "" ? "لا يوجد" : args,
                            isSelected: true,
                            unselectedBackgroundColor: AppColors.greenblue3,
                            titleStyle:theme.textTheme.subtitle1.copyWith(
                              color: AppColors.white,
                            ),
                            isToggeled: false,
                          ),
                          VerticalText(
                            title: StringConst.EDIT_CATEGORIE,
                            subtitle: "                   ->",
                            onPressed: () {
                              ExtendedNavigator.root.pop();
                            },
                            titleTextStyle: theme.textTheme.bodyText2.copyWith(
                              color: AppColors.blue,
                              fontSize: Sizes.SIZE_18,
                            ),
                            subtitleTextStyle: theme.textTheme.bodyText1.copyWith(
                              color: AppColors.blue,
                              fontSize: Sizes.SIZE_20,
                            ),
                          ),
                        ],
                    ),
                    SpaceH8(),
                    CustomButton(
                      onPressed: () {
                      },
                      title: StringConst.ADD_IMG,
                      color: AppColors.greenblue,
                      textStyle: theme.textTheme.subtitle1.copyWith(
                        color: AppColors.white,
                      ),
                      borderRadius: Sizes.RADIUS_8,
                    ),
                    SpaceH20(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: assignWidth(context: context, fraction: 0.3),
                          child: CustomButton(
                            //TODO/////////////////////////////////
                            onPressed: () async{
                              await user.addQuestion();
                            },
                            height: Sizes.HEIGHT_44,
                            title: StringConst.ADD,
                            color: AppColors.greenblue,
                            textStyle: theme.textTheme.subtitle1.copyWith(
                              color: AppColors.white,
                            ),
                            borderRadius: Sizes.RADIUS_8,
                          ),
                        ),
                        Container(
                          width: assignWidth(context: context, fraction: 0.3),
                          child: CustomButton(
                            onPressed: () {
                              ExtendedNavigator.root.pop();
                              ExtendedNavigator.root.pop();
                            },
                            height: Sizes.HEIGHT_44,
                            title: StringConst.CANCEL,
                            color: AppColors.white,
                            borderSide: BorderSide(color: AppColors.grey),
                            textStyle: theme.textTheme.subtitle1.copyWith(
                              color: AppColors.grey,
                            ),
                            borderRadius: Sizes.RADIUS_8,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
