import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_button_2.dart';
import 'package:wcif_application/widgets/shared/custom_text_form_field_2.dart';
import 'package:wcif_application/widgets/shared/main_menu.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/shared/auto_load.dart';

const double kBorderRadius = Sizes.RADIUS_8;

class AddEditQuestionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);

    TextStyle titleStyle = theme.textTheme.subtitle1.copyWith(
      color: AppColors.black50,
    );
    return AutoLoad(
      onInit: () async {
        // BotToast.showLoading();
        //await user.loadCategory();
        // BotToast.closeAllLoading();
      },
      child: Scaffold(
        body: Container(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: const Radius.circular(Sizes.RADIUS_60),
                    ),
                  ),
                  SpaceH63(),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: Sizes.PADDING_32,
                      horizontal: Sizes.PADDING_24,
                    ),
                    child: Row(
                      children: [
                        SpaceH63(),
                        Container(
                          width: Sizes.WIDTH_50,
                          height: Sizes.HEIGHT_50,
                          child: CustomButton2(
                            onPressed: () {
                              ExtendedNavigator.root.pop();
                            },
                            borderRadius: Sizes.RADIUS_12,
                            icon: Icons.arrow_back,
                            iconColor: AppColors.white,
                            color: AppColors.moov,
                          ),
                        ),
                        SpaceW20(),
                        Text(
                          StringConst.ADDQuestion,
                          style: theme.textTheme.headline5.copyWith(
                            color: AppColors.moov,
                            fontSize: Sizes.TEXT_SIZE_28,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        StringConst.QUESTIONTITEL,
                        style: titleStyle
                    ),
                    SpaceH16(),
                    CustomTextFormField(
                      controller: user.questionTitle,
                      textFormFieldStyle: theme.textTheme.subtitle1.copyWith(
                        color: AppColors.greenblue,
                      ),
                      prefixIconColor: AppColors.primaryColor,
                      hintTextStyle: theme.textTheme.bodyText2.copyWith(
                        color: AppColors.grey,
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                      borderStyle: BorderStyle.solid,
                    ),
                    SpaceH16(),
                    Text(
                        StringConst.QUESTIONDESCREPTION,
                        style: titleStyle
                    ),
                    SpaceH16(),
                    CustomTextFormField(
                      controller: user.questionContent,
                      maxLines: 10,
                      textFormFieldStyle: theme.textTheme.subtitle1.copyWith(
                        color: AppColors.greenblue,
                      ),
                      prefixIconColor: AppColors.primaryColor,
                      hintTextStyle: theme.textTheme.bodyText2.copyWith(
                        color: AppColors.grey,
                      ),
                      filled: true,
                      fillColor: AppColors.white,
                      borderStyle: BorderStyle.solid,
                    ),
                    SpaceH24(),
                    CustomButton(
                      onPressed: () {},
                      title: StringConst.ADDIMG,
                      color: AppColors.primaryColor,
                      textStyle: theme.textTheme.subtitle1.copyWith(
                        color: AppColors.white,
                      ),
                      borderRadius: Sizes.RADIUS_8,
                    ),
                    SpaceH30(),
                    SpaceH16(),
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
                            color: AppColors.primaryColor,
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
