import 'package:auto_route/auto_route.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:wcif_application/widgets/shared/answer_post_card.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_button_2.dart';
import 'package:wcif_application/widgets/shared/custom_text_form_field_2.dart';
import 'package:wcif_application/widgets/shared/question_post_card.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

const double kSidePadding = Sizes.PADDING_24;
const double kButtonWidth = Sizes.WIDTH_56;

class QuestionDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_16,
            ),
            child: ListView(
              children: [
                SpaceH8(),
                _buildListCards(context),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ExtendedNavigator.root.pop();
        },
        backgroundColor: AppColors.greenblue2,
        child: Icon(
          Icons.arrow_back,
          color: AppColors.white,
        ),
      ),

    );
  }

  @swidget
  Widget _buildListCards(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double widthOfScreen = assignWidth(context: context, fraction: 1);
    TextStyle headingStyle = theme.textTheme.subtitle2.copyWith(
      color: AppColors.blackFull,
      fontSize: Sizes.TEXT_SIZE_14,
      fontWeight: FontWeight.bold,
    );
    TextStyle contentStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.blackFull,
      fontSize: Sizes.TEXT_SIZE_16,
      fontWeight: FontWeight.bold,
    );
    TextStyle iconTextStyle = theme.textTheme.subtitle1.copyWith(
      color: AppColors.blackFull,
      fontWeight: FontWeight.bold,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          " السؤال:",
          textAlign: TextAlign.right,
          style: theme.textTheme.headline5.copyWith(
            color: AppColors.bluegreen,
          ),
        ),
        SpaceH8(),
        QuestionPostCard(
          headMainAxisAlignment: MainAxisAlignment.start,
          footerMainAxisAlignment: MainAxisAlignment.end,
          // height: assignHeight(context: context, fraction: 0.38),
          padding: const EdgeInsets.all(Sizes.PADDING_12),
          color: AppColors.greenligth,
          profileImagePath: ImagePath.MEN,
          auther: "الاسم",
          quationsTitel: "العنونا",
          quationsContent: "النص",
          contentTextAlign: TextAlign.center,
          hasImage: true,
          contentImagePath: ImagePath.BREAKFAST,
          date: "1-1",
          titleStyle: headingStyle,
          subtitleStyle: contentStyle,
          contentStyle: contentStyle,
          iconTextStyle: iconTextStyle,
          iconColor: AppColors.black50,
          numberOfComments: "0",
          // onDownVote: ,
          numberOfDownVotes: "0",
          // onUpVote: ,
          numberOfUpVotes: "0",
        ),
        SpaceH8(),
        Row(
          children: [
            Container(
              width: widthOfScreen - ((kSidePadding * 2) + kButtonWidth + 8),
              child: CustomTextFormField(
                hintTextStyle: theme.textTheme.bodyText2.copyWith(
                  color: AppColors.grey,
                ),
                filled: true,
                fillColor: AppColors.white,
                borderStyle: BorderStyle.solid,
                maxLines: 1,
                textFormFieldStyle: theme.textTheme.subtitle1.copyWith(
                  color: AppColors.bluegreen,
                ),
                hintText: "add answer",
                prefixIconColor: AppColors.bluegreen,
                // controller: cc,
                // hasPrefixIcon:true,
              ),
            ),
            SpaceW8(),
            Container(
              width: kButtonWidth,
              height: Sizes.HEIGHT_56,
              child: CustomButton2(
                onPressed: () {},
                borderRadius: Sizes.RADIUS_8,
                icon: FeatherIcons.send,
                color:AppColors.greenblue2,
              ),
            )
          ],
        ),
        SpaceH8(),
        Text(
          " الإجابــــات:",
          textAlign: TextAlign.right,
          style: theme.textTheme.headline5.copyWith(
            color: AppColors.bluegreen,
          ),
        ),
        SpaceH8(),
        AnswerPostCard(
          headMainAxisAlignment: MainAxisAlignment.start,
          footerMainAxisAlignment: MainAxisAlignment.end,
          height: assignHeight(context: context, fraction: 0.25),
          padding: const EdgeInsets.all(Sizes.PADDING_16),
          color: AppColors.grey2,
          profileImagePath: ImagePath.MEN,
          title:"العنوان",
          content: "المحتوي",
          subTitle: "2-2",
          titleStyle: headingStyle,
          subtitleStyle: contentStyle,
          contentStyle: contentStyle,
          iconTextStyle: iconTextStyle,
          iconColor: AppColors.black50,
        ),
      ],
    );
  }
}
