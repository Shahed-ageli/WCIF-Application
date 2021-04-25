import 'package:auto_route/auto_route.dart';
import 'package:wcif_application/themes/theme_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:wcif_application/widgets/shared/custom_painters.dart';
import 'package:wcif_application/widgets/shared/custom_text_form_field.dart';
import 'package:wcif_application/widgets/shared/tear_drop_button.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/public_models/loading.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({@required this.themeBloc});

  final ThemeBloc themeBloc;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  @override
  Widget build(BuildContext context) {
    double tearDropButtonRadius =  assignHeight(context: context, fraction: 0.07);
    var loading = Provider.of<LoadingModel>(context, listen: true);
    var user = Provider.of<UserController>(context, listen: true);
    ThemeData theme = Theme.of(context);


    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Container(
          child: ListView(
              children: [ Column(
              children: [
                _drawTearDrop(),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
                  child: _buildForm(),
                ),
                SpaceH20(),
                Container(
                  height: tearDropButtonRadius * 3,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TearDropButton(
                            buttonText: StringConst.SIGN_IN,
                            radius: tearDropButtonRadius,
                            tearDropAlignment: TearDropAlignment.topRight,
                            hasShadow: true,
                            //TODO: ontap action
                            onTap:  ()  async {
                              // loading.start();
                              await user.login();
                              // loading.stop();
                              // ExtendedNavigator.root.push(Routes.homeScreen);

                            },
                          ),
                          SpaceW16(),
                          Container(
                            margin: EdgeInsets.only(top: tearDropButtonRadius),
                            child: TearDropButton(
                              buttonText: StringConst.SIGN_UP,
                              radius: tearDropButtonRadius,
                              tearDropAlignment: TearDropAlignment.bottomLeft,
                              style: PaintingStyle.stroke,
                              color: AppColors.purpleH,
                              buttonTextStyle: theme.textTheme.bodyText1.copyWith(
                                color: AppColors.purpleH,
                              ),
                              //TODO: ontap action
                              onTap: () {
                                ExtendedNavigator.root.push(Routes.signUpScreen);
                              },
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                SpaceH20(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    StringConst.DONT_HAVE_AN_ACCOUNT,
                    style: theme.textTheme.bodyText1.copyWith(
                      color: AppColors.purpleH,
                    ),
                  ),
                ),
              ],
            ),
        ],
          ),
        ),
      ),
    );
  }

  Widget _drawTearDrop() {
    double radius = assignWidth(context: context, fraction: 0.35);
    ThemeData theme = Theme.of(context);
    return Container(
      height: radius * 2,
      width: widthOfScreen(context),
      child: Stack(
        children: [
          Container(
            height: radius,
            width: radius,
            color: AppColors.greenblue,
            child: CustomPaint(
              painter: DrawCircle(
                offset: Offset(
                  radius,
                  radius,
                ),
                radius: radius,
                color: AppColors.greenblue,
              ),
            ),
          ),
          Container(
            width: radius * 2,
            padding: const EdgeInsets.only(right: Sizes.PADDING_16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConst.LETS_GET_STARTED,
                  style: theme.textTheme.headline5.copyWith(
                    color: AppColors.violet400,
                  ),
                ),
                Text(
                  StringConst.LOGIN_MSG,
                  style: theme.textTheme.bodyText1.copyWith(
                    color: AppColors.violet400,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildForm() {
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);

    TextStyle titleTextStyle = theme.textTheme.subtitle2.copyWith(
      color: AppColors.greenblue,
    );
    TextStyle hintTextStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.purpleH,
    );
    UnderlineInputBorder customUnderlineInputBorder =
    Borders.customUnderlineInputBorder(
      color: AppColors.purpleH,
    );
    return Container(
      child: Column(
        children: [
          CustomTextFormField(
            controller:  user.emailIn,
            hasTitle: true,
            titleStyle: titleTextStyle,
            title: StringConst.EMAIL,
            textStyle: hintTextStyle,
            hasPrefixIcon: true,
            prefixIcon: Container(
              transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
              child: Icon(
                Icons.email,
                color: AppColors.greenblue,
                size: Sizes.ICON_SIZE_20,
              ),
            ),
            border: customUnderlineInputBorder,
            focusedBorder: customUnderlineInputBorder,
            enabledBorder: customUnderlineInputBorder,
            hintText: StringConst.EMAIL_HINT_TEXT,
            hintTextStyle: hintTextStyle,
          ),
          SpaceH8(),
          CustomTextFormField(
            controller:  user.passwordIn,
            hasTitle: true,
            title: StringConst.PASSWORD,
            titleStyle: titleTextStyle,
            textStyle: hintTextStyle,
            hasPrefixIcon: true,
            prefixIcon: Container(
              transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
              child: Icon(
                FeatherIcons.key,
                color: AppColors.greenblue,
                size: Sizes.ICON_SIZE_20,
              ),
            ),
            obscured: true,
            border: customUnderlineInputBorder,
            focusedBorder: customUnderlineInputBorder,
            enabledBorder: customUnderlineInputBorder,
            hintText: StringConst.PASSWORD_HINT_TEXT,
            hintTextStyle: hintTextStyle,
          ),
          SpaceH16(),
          InkWell(
            onTap: () {},
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                StringConst.FORGOT_PASSWORD,
                style: titleTextStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
