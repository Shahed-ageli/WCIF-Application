import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/public_models/loading.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/main_menu.dart';
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
import 'package:wcif_application/widgets/shared/auto_load.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var loading = Provider.of<LoadingModel>(context, listen: true);
    var user = Provider.of<UserController>(context, listen: true);

    TextStyle subtitleTextStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.white,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    return AutoLoad(
      onInit: () async {
        // BotToast.showLoading();
        await user.loadQustionsProfile();
        // BotToast.closeAllLoading();
      },
      child: Scaffold(
        backgroundColor: AppColors.purpleL,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
          child: CustomAppBar(),
        ),
        drawer: MainMenu(),
        body: LoadingBox(
          child: Stack(
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
                  // _buildListCards(context),
                  user.ProfileState == 0
                      ? Container()
                      : user.ProfileState == 1
                      ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: user.qustionsProfileList.length,
                    itemBuilder: (context, index) {
                      return _buildListCards(context,index,user);
                    },
                  )
                      : user.ProfileState == 2
                      ? Container(
                    child: Text("حدث خطأ ما"),
                  )
                      : Container(),
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
                          //TODO///////////////////////////////////////////////
                          title: StringConst.NUMBER_OF_FOLLOWERS,
                          subtitle: StringConst.FOLLOWERS,
                          subtitleTextStyle: subtitleTextStyle,
                        ),
                        VerticalText(
                          //TODO////////////////////////////////////////////
                          title: StringConst.NUMBER_OF_FOLLOWING,
                          subtitle: StringConst.FOLLOWING,
                          subtitleTextStyle: subtitleTextStyle,
                        ),
                        VerticalText(
                          //TODO////////////////////////////////////////////
                          title:"3",
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
                      backgroundImage: AssetImage(ImagePath.MEN),
                      minRadius: Sizes.RADIUS_60,
                      maxRadius: Sizes.RADIUS_60,
                    ),
                    // SpaceH16(),
                    VerticalText(
                      title: user.user.firstName + " " +  user.user.lastName,
                      titleTextStyle: theme.textTheme.headline5.copyWith(
                        color: AppColors.violet400,
                      ),
                      subtitle:  user.user.phone +"/"+ user.user.email,
                      subtitleTextStyle: theme.textTheme.bodyText1.copyWith(
                        color: AppColors.purpleH,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.primaryColor,
          //TODO:Screen ADD Q
          onPressed: () {
            ExtendedNavigator.root.push(Routes.questionCategoryScreen);
          },
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  @swidget
  Widget _buildListCards(BuildContext  context,int index,UserController user) {
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
      children:[
        QuestionPostCard(
          headMainAxisAlignment: MainAxisAlignment.start,
          footerMainAxisAlignment: MainAxisAlignment.end,
          height: assignHeight(context: context, fraction: 0.35),
          padding: const EdgeInsets.all(Sizes.PADDING_16),
          color: AppColors.violet200,
          profileImagePath: ImagePath.MEN,
          title: user.qustionsProfileList[index].auther,
          content: user.qustionsProfileList[index].questionTitle+' '+user.qustionsProfileList[index].questionContent,
          contentTextAlign: TextAlign.center,
          hasImage: true,
          contentImagePath: ImagePath.BREAKFAST,
          subTitle:  user.qustionsProfileList[index].date,
          titleStyle: headingStyle,
          subtitleStyle: contentStyle,
          contentStyle: contentStyle,
          iconTextStyle: iconTextStyle,
          iconColor: AppColors.purpleH,
          canShare: false,
        ),
        SpaceH16(),
      ]
    );
  }
}
