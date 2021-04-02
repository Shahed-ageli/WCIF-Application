import 'package:auto_route/auto_route.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/search_input.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/curved_app_bar.dart';
import 'package:wcif_application/widgets/shared/curved_container.dart';
import 'package:wcif_application/widgets/shared/question_post_card.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/shared/vertical_text.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    TextStyle subtitleTextStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.white,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    return Scaffold(
      backgroundColor: AppColors.purpleH,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
        child: CustomAppBar(),
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.PADDING_16,
              vertical: Sizes.PADDING_16,
            ),
            shrinkWrap: true,
            children: [
              SizedBox(
                height: assignHeight(context: context, fraction: 0.55),
              ),
              _buildListCards(context),
              SpaceH16(),
              _buildListCards(context),
            ],
          ),
          CurvedContainer(
            backgroundColor: AppColors.primaryColor,
            bottomLeftRadius: Sizes.RADIUS_80,
            height: assignHeight(context: context, fraction: 0.525),
            child: Column(
              children: [
                Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    VerticalText(
                      title: StringConst.NUMBER_OF_FOLLOWERS,
                      subtitle: StringConst.FOLLOWERS,
                      subtitleTextStyle: subtitleTextStyle,
                    ),
                    VerticalText(
                      title: StringConst.NUMBER_OF_FOLLOWING,
                      subtitle: StringConst.FOLLOWING,
                      subtitleTextStyle: subtitleTextStyle,
                    ),
                    VerticalText(
                      title: StringConst.NUMBER_OF_LIKES,
                      subtitle: StringConst.Questions,
                      subtitleTextStyle: subtitleTextStyle,
                    )
                  ],
                ),
                SpaceH24(),
              ],
            ),
          ),
          CurvedAppBar(
            backgroundColor: AppColors.white,
            hasTrailing: true,

            iconColor: AppColors.violet400,
            height: assignHeight(context: context, fraction: 0.4),
            bottomLeftRadius: Sizes.RADIUS_80,

            title: Column(
              children: [
                SpaceH12(),
                CircleAvatar(
                  backgroundImage: AssetImage(ImagePath.JACK_SNOW),
                  minRadius: Sizes.RADIUS_60,
                  maxRadius: Sizes.RADIUS_60,
                ),
                // SpaceH16(),
                VerticalText(
                  title: StringConst.AHMED,
                  titleTextStyle: theme.textTheme.headline5.copyWith(
                    color: AppColors.violet400,
                  ),
                  subtitle: StringConst.LOCATION,
                  subtitleTextStyle: theme.textTheme.bodyText1.copyWith(
                    color: AppColors.purpleH,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.white,
        //TODO:Screen ADD Q
        onPressed: () {
          ExtendedNavigator.root.push(Routes.questionCategoryScreen);
        },
        child: Icon(
          Icons.add,
          color: AppColors.moov,
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

    return QuestionPostCard(
      headMainAxisAlignment: MainAxisAlignment.start,
      footerMainAxisAlignment: MainAxisAlignment.end,
      height: assignHeight(context: context, fraction: 0.35),
      padding: const EdgeInsets.all(Sizes.PADDING_16),
      color: AppColors.violet200,
      profileImagePath: ImagePath.JACK_SNOW,
      title: StringConst.AHMED,
      content: StringConst.SHORT_LOREM_IPSUM,
      contentTextAlign: TextAlign.center,
      hasImage: true,
      contentImagePath: ImagePath.BREAKFAST,
      subTitle: StringConst.DATE,
      titleStyle: headingStyle,
      subtitleStyle: contentStyle,
      contentStyle: contentStyle,
      iconTextStyle: iconTextStyle,
      iconColor: AppColors.purpleH,
      canShare: false,
    );
  }
}
