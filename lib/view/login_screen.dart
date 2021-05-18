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
import 'package:wcif_application/widgets/layout/loading.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({@required this.themeBloc});

  final ThemeBloc themeBloc;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static bool visibil= false;

  @override
  void initState() {
    super.initState();
  }


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
        body: LoadingBox(
          child: Container(
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
                                if( (user.emailIn).text=='' ||  (user.passwordIn).text==''){
                                  setState(() {
                                    visibil=true;
                                  });
                                }else{
                                  setState(() {
                                    visibil=false;
                                  });
                                  loading.start();
                                  await user.login();
                                  loading.stop();
                                  (user.emailIn).clear();
                                  (user.passwordIn).clear();
                                }
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
                                color: AppColors.black50,
                                buttonTextStyle: theme.textTheme.bodyText1.copyWith(
                                  color: AppColors.black50,
                                ),
                                //TODO: ontap action
                                onTap: () {
                                  ExtendedNavigator.root.push(Routes.signUpScreen);
                                  (user.emailIn).clear();
                                  (user.passwordIn).clear();
                                  setState(() {
                                    visibil = false;
                                  });
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
                        color: AppColors.black50,
                      ),
                    ),
                  ),],
                ),],
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
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  StringConst.LOGIN_MSG,
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

    TextStyle textStyle = theme.textTheme.subtitle2.copyWith(
      color: AppColors.blackFull,
      fontSize: Sizes.TEXT_SIZE_18,
    );

    TextStyle hintTextStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.black50,
    );
    UnderlineInputBorder customUnderlineInputBorder =
    Borders.customUnderlineInputBorder(
      color: AppColors.black50,
    );
    return Container(
      child: Column(
        children: [
          CustomTextFormField(
            // onChanged: () {
            //
            // },
            controller:  user.emailIn,
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
            // onChanged: () {
            //   visibil=false;
            // },
            controller:  user.passwordIn,
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
          Row(
            mainAxisAlignment:MainAxisAlignment.spaceBetween,
            children:[
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
            ]
          ),
        ],
      ),
    );
  }
}
