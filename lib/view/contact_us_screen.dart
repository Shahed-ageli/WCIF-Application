import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/custom_text_form_field.dart';
import 'package:wcif_application/widgets/shared/main_menu.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/shared/tear_drop_button.dart';

class AboutUsScreen extends StatefulWidget {
  @override
  _AboutUsScreenState createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenligth2,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
        child: CustomAppBar(
          hasTitle: true,
          title: "تواصل معنا",
        ),
      ),
      drawer: MainMenu(),
      body:Stack(
        children:[
          Container(
            height: assignHeight(context: context, fraction: 0.4),
            child: PageView(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(Sizes.RADIUS_60),
                    bottomRight: const Radius.circular(Sizes.RADIUS_60),
                  ),
                  child: Image.asset(
                    ImagePath.CONTACT_US,
                    width: assignWidth(context: context, fraction: 1),
                    height: assignHeight(context: context, fraction: 0.4),
                    fit: BoxFit.fill,
                  ),
                ),
              ]
            ),
          ),
          Container(
            padding:
            const EdgeInsets.symmetric(horizontal: Sizes.PADDING_24),
            child: _buildForm(),
          ),
        ]
      ),
    );
  }

  Widget _buildForm() {
    ThemeData theme = Theme.of(context);
    double tearDropButtonRadius =  assignHeight(context: context, fraction: 0.6);
    TextStyle titleTextStyle = theme.textTheme.subtitle2.copyWith(
      color: AppColors.greenblue,
      fontSize: Sizes.TEXT_SIZE_20,
      fontWeight: FontWeight.bold,
    );
    TextStyle textStyle = theme.textTheme.subtitle2.copyWith(
      color: AppColors.black,
      fontSize: Sizes.TEXT_SIZE_18,
    );
    TextStyle hintTextStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.black60,
    );
    UnderlineInputBorder customUnderlineInputBorder =
    Borders.customUnderlineInputBorder(
      color: AppColors.black50,
    );
    return Container(
      child: Column(
        children: [
          Spacer(),
          CustomTextFormField(
            // controller: ,
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
            // controller:
            hasTitle: true,
            title: StringConst.NAME,
            titleStyle: titleTextStyle,
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
            obscured: true,
            border: customUnderlineInputBorder,
            focusedBorder: customUnderlineInputBorder,
            enabledBorder: customUnderlineInputBorder,
            hintText: StringConst.LOG_IN_NAME,
            hintTextStyle: hintTextStyle,
          ),
          SpaceH8(),
          CustomTextFormField(
            // controller:
            hasTitle: true,
            title: StringConst.MASSAGE,
            titleStyle: titleTextStyle,
            textStyle: textStyle,
            hasPrefixIcon: true,
            prefixIcon: Container(
              transform: Matrix4.translationValues(-10.0, 0.0, 0.0),
              child: Icon(
                FeatherIcons.messageSquare,
                color: AppColors.greenblue,
                size: Sizes.ICON_SIZE_24,
              ),
            ),
            obscured: true,
            border: customUnderlineInputBorder,
            focusedBorder: customUnderlineInputBorder,
            enabledBorder: customUnderlineInputBorder,
            hintText: StringConst.WRITE_MASSAGE,
            hintTextStyle: hintTextStyle,
          ),
          SpaceH12(),
          TearDropButton(
            buttonText: StringConst.SEND,
            radius: tearDropButtonRadius,
            tearDropAlignment: TearDropAlignment.topRight,
            hasShadow: true,
            //TODO: ontap action
            onTap:  ()  async {},
          ),
          SpaceH12(),
        ],
      ),
    );
  }
}
