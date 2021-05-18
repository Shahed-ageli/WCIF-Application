import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/widgets/layout/loading.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/ielsh/AndroidStudioProjects/wcif_application/lib/widgets/layout/auto_load.dart';
import 'package:wcif_application/widgets/shared/curved_app_bar.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/question_post_card.dart';
import 'package:wcif_application/widgets/shared/search_input.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/values/values.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import '../widgets/shared/main_menu.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);

    return AutoLoad(
      onInit: () async {
        await user.getQustions();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
          child: CustomAppBar(
            hasTitle: true,
            title:StringConst.TIMELINE,
          ),
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
                    height: 140,
                  ),
                  user.homeState == 0 ?
                  Column(
                      children: [
                        Text(
                          StringConst.INLOAD,
                          style: theme.textTheme.bodyText1.copyWith(
                            color: AppColors.blackFull,
                            fontSize:Sizes.SIZE_20,
                          ),
                        ),
                        Image.asset(ImagePath.LOAD)
                      ])
                      : user.homeState == 1
                      ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: user.qustionsList.length,
                    itemBuilder: (context, index) {
                      return _buildListCards(context,index,user);
                    },
                  )
                      : user.homeState == 2 ?
                  Container(
                    child: Text(
                        StringConst.PROBLEM_IN_LOAD,
                      style: theme.textTheme.bodyText1.copyWith(
                        color: AppColors.blackFull,
                        fontSize:Sizes.SIZE_20,
                      ),
                    ),
                  )
                      : Container(),
                ],
              ),
            ),
            CurvedAppBar(
              backgroundColor: AppColors.white,
              iconColor: AppColors.grey2,
              bottomLeftRadius: Sizes.RADIUS_80,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              title:Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start ,
                  children: [
                    SearchInput(),
                    Text(
                      "  "+StringConst.TIMELINE,
                      textAlign: TextAlign.start,
                      style: theme.textTheme.headline5.copyWith(
                        color: AppColors.bluegreen,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          //TODO:Screen ADD Q
          onPressed: () {
            ExtendedNavigator.root.push(Routes.questionCategoryScreen);
          },
          backgroundColor: AppColors.greenblue,
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
      children: [
        QuestionPostCard(
          headMainAxisAlignment: MainAxisAlignment.start,
          footerMainAxisAlignment: MainAxisAlignment.end,
          //height: assignHeight(context: context, fraction: 0.50),
          padding: const EdgeInsets.all(Sizes.PADDING_12),
          color: AppColors.greenligth,
          profileImagePath: ImagePath.MEN,
          auther: user.qustionsList[index].LoginName,
          date:  user.qustionsList[index].CreatedOn.toString().replaceRange(10, user.qustionsList[index].CreatedOn.toString().length, " "),
          quationsTitel: user.qustionsList[index].QuestionTitle,
          quationsContent: user.qustionsList[index].QuestionContent,
          contentTextAlign: TextAlign.start,
          hasImage: true,
          contentImagePath: ImagePath.BREAKFAST,
          titleStyle: headingStyle,
          subtitleStyle: contentStyle,
          contentStyle: contentStyle,
          iconTextStyle: iconTextStyle,
          iconColor: AppColors.black50,
          onCommentsTap: (){ExtendedNavigator.root.push(Routes.questionDetailsScreen);},
          numberOfComments: user.qustionsList[index].AnswerCount.toString(),
          // onDownVote: ,
          numberOfDownVotes: user.qustionsList[index].DownVotes.toString(),
          // onUpVote: ,
          numberOfUpVotes: user.qustionsList[index].UpVotes.toString(),
        ),
        SpaceH16(),
      ],
    );
  }
}
