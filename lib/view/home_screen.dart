import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/public_models/loading.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/auto_load.dart';
import 'package:wcif_application/widgets/shared/curved_app_bar.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/question_post_card.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';

import '../widgets/shared/main_menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double heightOfAppBar = assignHeight(context: context, fraction: 0.2);
    var loading = Provider.of<LoadingModel>(context, listen: true);
    var user = Provider.of<UserController>(context, listen: true);

    return AutoLoad(
      onInit: () async {
       // BotToast.showLoading();
        await user.loadQustions();
       // BotToast.closeAllLoading();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
          child: CustomAppBar(),
        ),
        drawer: MainMenu(),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.PADDING_16,
              ),
              child: ListView(
                children: [
                  SizedBox(
                    height: heightOfAppBar,
                  ),
                  //_buildListCards(context),
                  user.homeState == 0
                      ? Container()
                      : user.homeState == 1
                      ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: user.qustionsList.length,
                    itemBuilder: (context, index) {
                      return _buildListCards(context,index,user);
                    },
                  )
                      : user.homeState == 2
                      ? Container(
                    child: Text("حدث خطأ ما"),
                  )
                      : Container(),
                ],
              ),
            ),
            CurvedAppBar(
              backgroundColor: AppColors.white,
              //iconColor: AppColors.violet400,
              //height: Sizes.HEIGHT_200,
              bottomLeftRadius: Sizes.RADIUS_80,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              title: Padding(
                padding: const EdgeInsets.only(
                  left: Sizes.PADDING_44,
                  top: Sizes.PADDING_16,
                ),
                child: Column(
                  children: [
                    Text(
                      StringConst.TIMELINE,
                      textAlign: TextAlign.left,
                      style: theme.textTheme.headline5.copyWith(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          //TODO:Screen ADD Q
          onPressed: () {
            ExtendedNavigator.root.push(Routes.questionCategoryScreen);
          },
          backgroundColor: AppColors.primaryColor,
          child: Icon(
            Icons.add,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }

  @swidget
  Widget _buildListCards(BuildContext context,int index,UserController user) {
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
        // QuestionPostCard(
        //   headMainAxisAlignment: MainAxisAlignment.start,
        //   footerMainAxisAlignment: MainAxisAlignment.end,
        //   height: assignHeight(context: context, fraction: 0.35),
        //   padding: const EdgeInsets.all(Sizes.PADDING_16),
        //   color: AppColors.white,
        //   profileImagePath: ImagePath.JOHN_BROWN,
        //   title: StringConst.JOHN_BROWN,
        //   content: StringConst.SHORT_LOREM_IPSUM,
        //   contentTextAlign: TextAlign.center,
        //   hasImage: true,
        //   contentImagePath: ImagePath.ALICIA,
        //   subTitle: StringConst.DATE,
        //   iconTextStyle: iconTextStyle,
        //   iconColor: AppColors.purpleH,
        //   onCommentsTap:() {
        //     ExtendedNavigator.root.push(Routes.questionDetailsScreen);
        //   },
        // ),
        // SpaceH16(),
        QuestionPostCard(
          headMainAxisAlignment: MainAxisAlignment.start,
          footerMainAxisAlignment: MainAxisAlignment.end,
          height: assignHeight(context: context, fraction: 0.25),
          padding: const EdgeInsets.all(Sizes.PADDING_16),
          color: AppColors.violet400,
          profileImagePath: ImagePath.JEAN_COUTU,
          title: user.qustionsList[index].auther,
          content: user.qustionsList[index].questionTitle+' '+user.qustionsList[index].questionContent,
          // hasImage: true,
          // contentImagePath: ImagePath.BREAKFAST,
          subTitle:  user.qustionsList[index].date,
          titleStyle: headingStyle,
          subtitleStyle: contentStyle,
          contentStyle: contentStyle,
          iconTextStyle: iconTextStyle,
          iconColor: AppColors.purpleH,
        ),
        SpaceH16(),
        // QuestionPostCard(
        //   headMainAxisAlignment: MainAxisAlignment.start,
        //   footerMainAxisAlignment: MainAxisAlignment.end,
        //   height: assignHeight(context: context, fraction: 0.25),
        //   padding: const EdgeInsets.all(Sizes.PADDING_16),
        //   color: AppColors.white,
        //   profileImagePath: ImagePath.MAXIME_BARBOSA,
        //   title: StringConst.MAXIME_BARBOSA,
        //   content: StringConst.LOREM_IPSUM,
        //   subTitle: StringConst.DATE,
        //   iconTextStyle: iconTextStyle,
        //   iconColor: AppColors.purpleH,
        // ),
        // SpaceH16(),
      ],
    );
  }
}
