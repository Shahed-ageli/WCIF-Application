import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:wcif_application/widgets/shared/custom_painters.dart';
import 'package:wcif_application/widgets/shared/custom_text_form_field.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/shared/tear_drop_button.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/layout/loading.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  static bool visibil= false;

  @override
  Widget build(BuildContext context) {
    double tearDropButtonRadius = assignHeight(context: context, fraction: 0.07);
    ThemeData theme = Theme.of(context);
    var loading = Provider.of<LoadingModel>(context, listen: true);
    var user = Provider.of<UserController>(context, listen: true);


    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: LoadingBox(
          child: Container(
            child: ListView(
              children: [
                _drawTearDrop(),
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.PADDING_24
                  ),
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
                          Container(
                            margin: EdgeInsets.only(top: tearDropButtonRadius),
                            child: TearDropButton(
                              buttonText: StringConst.SIGN_IN,
                              radius: tearDropButtonRadius,
                              tearDropAlignment: TearDropAlignment.bottomRight,
                              style: PaintingStyle.stroke,
                              color: AppColors.black50,
                              buttonTextStyle: theme.textTheme.bodyText1.copyWith(
                                color: AppColors.black50,
                              ),
                              //TODO: action onTap
                              onTap: () {
                                ExtendedNavigator.root.pop();
                                (user.firstNameRg).clear();
                                (user.lastNameRg).clear();
                                (user.loginNameRg).clear();
                                (user.emailRg).clear();
                                (user.phoneRg).clear();
                                (user.passwordRg).clear();
                                setState(() {
                                  visibil = false;
                                });
                              },
                            ),
                          ),
                          SpaceW16(),
                          TearDropButton(
                            buttonText: StringConst.SIGN_UP,
                            radius: tearDropButtonRadius,
                            tearDropAlignment: TearDropAlignment.topLeft,
                            hasShadow: true,
                            //TODO: action onTap
                            onTap: () async {
                              if( (user.firstNameRg).text=='' ||
                                  (user.lastNameRg).text==''  ||
                                  (user.emailRg).text==''  ||
                                  (user.phoneRg).text==''  ||
                                  (user.passwordRg).text=='' ||
                                  (user.loginNameRg).text==''){
                                setState(() {
                                  visibil=true;
                                });
                              }else {
                                setState(() {
                                  visibil = false;
                                });
                                  loading.start();
                                  await user.registration();
                                  loading.stop();
                                  (user.firstNameRg).clear();
                                  (user.lastNameRg).clear();
                                  (user.loginNameRg).clear();
                                  (user.emailRg).clear();
                                  (user.phoneRg).clear();
                                  (user.passwordRg).clear();
                              }
                            },
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
                    StringConst.ALREADY_HAVE_AN_ACCOUNT,
                    style: theme.textTheme.bodyText1.copyWith(
                      color: AppColors.black50,
                    ),
                  ),
                ),
              ],
            ),
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
            width: radius * 4,
            padding: const EdgeInsets.only(right: Sizes.PADDING_16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConst.LETS_GET_STARTED,
                  style: theme.textTheme.headline5.copyWith(
                    color: AppColors.white,
                      fontWeight: FontWeight.bold
                  ),
                ),
                Text(
                  StringConst.CREATE_ACCOUNT,
                  style: theme.textTheme.bodyText1.copyWith(
                    color: AppColors.blackFull,
                    fontWeight: FontWeight.bold,
                    fontSize: Sizes.SIZE_20,
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
      fontSize: Sizes.TEXT_SIZE_20,

    );
    TextStyle hintTextStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.black50,
    );
    TextStyle textStyle = theme.textTheme.subtitle2.copyWith(
      color: AppColors.blackFull,
      fontSize: Sizes.TEXT_SIZE_20,
    );
    UnderlineInputBorder customUnderlineInputBorder =
    Borders.customUnderlineInputBorder(
      color: AppColors.black50,
    );

    return Column(
      children: [
        CustomTextFormField(
          controller: user.firstNameRg ,
          hasTitle: true,
          titleStyle: titleTextStyle,
          title: StringConst.FIRST_NAME,
          textStyle: textStyle,
          hasPrefixIcon: true,
          prefixIcon: Container(
            transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
            child: Icon(
              Icons.account_circle,
              color: AppColors.greenblue,
              size: Sizes.ICON_SIZE_24,
            ),
          ),
          border: customUnderlineInputBorder,
          focusedBorder: customUnderlineInputBorder,
          enabledBorder: customUnderlineInputBorder,
          hintText: StringConst.FIRST_NAME,
          hintTextStyle: hintTextStyle,
        ),
        SpaceH8(),
        CustomTextFormField(
          controller: user.lastNameRg,
          hasTitle: true,
          titleStyle: titleTextStyle,
          title: StringConst.LAST_NAME,
          textStyle: textStyle,
          hasPrefixIcon: true,
          prefixIcon: Container(
            transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
            child: Icon(
              Icons.account_circle ,
              color: AppColors.greenblue,
              size: Sizes.ICON_SIZE_24,
            ),
          ),
          border: customUnderlineInputBorder,
          focusedBorder: customUnderlineInputBorder,
          enabledBorder: customUnderlineInputBorder,
          hintText: StringConst.LAST_NAME,
          hintTextStyle: hintTextStyle,
        ),
        SpaceH8(),
        CustomTextFormField(
          controller: user.loginNameRg,
          hasTitle: true,
          titleStyle: titleTextStyle,
          title: StringConst.LOG_IN_NAME,
          textStyle: textStyle,
          hasPrefixIcon: true,
          prefixIcon: Container(
            transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
            child: Icon(
              Icons.account_box_rounded ,
              color: AppColors.greenblue,
              size: Sizes.ICON_SIZE_24,
            ),
          ),
          border: customUnderlineInputBorder,
          focusedBorder: customUnderlineInputBorder,
          enabledBorder: customUnderlineInputBorder,
          hintText: StringConst.LOG_IN_NAME,
          hintTextStyle: hintTextStyle,
        ),
        SpaceH8(),
        CustomTextFormField(
          controller: user.emailRg,
          hasTitle: true,
          titleStyle: titleTextStyle,
          title: StringConst.EMAIL,
          textStyle: textStyle,
          hasPrefixIcon: true,
          prefixIcon: Container(
            transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
            child: Icon(
              Icons.email,
              color: AppColors.greenblue,
              size: Sizes.ICON_SIZE_24,
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
          controller: user.phoneRg,
          hasTitle: true,
          titleStyle: titleTextStyle,
          title: StringConst.PHON_NUMPER,
          textStyle: textStyle,
          hasPrefixIcon: true,
          prefixIcon: Container(
            transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
            child: Icon(
              Icons.phone_enabled_rounded,
              color: AppColors.greenblue,
              size: Sizes.ICON_SIZE_24,
            ),
          ),
          border: customUnderlineInputBorder,
          focusedBorder: customUnderlineInputBorder,
          enabledBorder: customUnderlineInputBorder,
          hintText: StringConst.PHON_NUMPER_HINT,
          hintTextStyle: hintTextStyle,
        ),
        SpaceH8(),
        CustomTextFormField(
          controller: user.passwordRg,
          hasTitle: true,
          title: StringConst.PASSWORD,
          titleStyle: titleTextStyle,
          textStyle: textStyle,
          hasPrefixIcon: true,
          prefixIcon: Container(
            transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
            child: Icon(
              FeatherIcons.key,
              color: AppColors.greenblue,
              size: Sizes.ICON_SIZE_18,
            ),
          ),
          obscured: true,
          border: customUnderlineInputBorder,
          focusedBorder: customUnderlineInputBorder,
          enabledBorder: customUnderlineInputBorder,
          hintText: StringConst.PASSWORD_HINT_TEXT,
          hintTextStyle: hintTextStyle,
        ),
        SpaceH8(),
        Visibility(
          visible: visibil,
          child: Text(
            StringConst.FORGOT,
            style: theme.textTheme.bodyText1.copyWith(
              color: AppColors.red,
              fontSize: Sizes.SIZE_16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
