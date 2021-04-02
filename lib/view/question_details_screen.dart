import 'package:auto_route/auto_route.dart';
import 'package:wcif_application/widgets/shared/answer_post_card.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/question_post_card.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

class QuestionDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_16,
            ),
            child: ListView(
              children: [
                SpaceH4(),
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
        backgroundColor: AppColors.primaryColor,
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
    TextStyle headingStyle = theme.textTheme.subtitle2.copyWith(
      color: AppColors.white,
    );
    TextStyle contentStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.purpleL,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    TextStyle iconTextStyle = theme.textTheme.subtitle1.copyWith(
      color: AppColors.purpleL,
    );

    return Column(
      children: [
        QuestionPostCard(
          headMainAxisAlignment: MainAxisAlignment.start,
          footerMainAxisAlignment: MainAxisAlignment.end,
          height: assignHeight(context: context, fraction: 0.35),
          padding: const EdgeInsets.all(Sizes.PADDING_16),
          color: AppColors.white,
          profileImagePath: ImagePath.JOHN_BROWN,
          title: StringConst.JOHN_BROWN,
          content: StringConst.SHORT_LOREM_IPSUM,
          contentTextAlign: TextAlign.center,
          hasImage: true,
          contentImagePath: ImagePath.ALICIA,
          subTitle: StringConst.DATE,
          iconTextStyle: iconTextStyle,
          iconColor: AppColors.purpleH,
        ),
        SpaceH16(),
        AnswerPostCard(
          headMainAxisAlignment: MainAxisAlignment.start,
          footerMainAxisAlignment: MainAxisAlignment.end,
          height: assignHeight(context: context, fraction: 0.25),
          padding: const EdgeInsets.all(Sizes.PADDING_16),
          color: AppColors.violet400,
          profileImagePath: ImagePath.JEAN_COUTU,
          title: StringConst.JEAN_COUTU,
          content: StringConst.LOREM_IPSUM,
          subTitle: StringConst.TIME,
          titleStyle: headingStyle,
          subtitleStyle: contentStyle,
          contentStyle: contentStyle,
          iconTextStyle: iconTextStyle,
          iconColor: AppColors.purpleH,
        ),
        SpaceH16(),
        AnswerPostCard(
          headMainAxisAlignment: MainAxisAlignment.start,
          footerMainAxisAlignment: MainAxisAlignment.end,
          height: assignHeight(context: context, fraction: 0.25),
          padding: const EdgeInsets.all(Sizes.PADDING_16),
          color: AppColors.white,
          profileImagePath: ImagePath.MAXIME_BARBOSA,
          title: StringConst.MAXIME_BARBOSA,
          content: StringConst.LOREM_IPSUM,
          subTitle: StringConst.DATE,
          iconTextStyle: iconTextStyle,
          iconColor: AppColors.purpleH,
        ),
        SpaceH16(),
      ],
    );
  }
}
