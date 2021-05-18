import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/main_menu.dart';
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
import 'file:///C:/Users/ielsh/AndroidStudioProjects/wcif_application/lib/widgets/layout/auto_load.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);
    TextStyle subtitleTextStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.white,
      fontSize: Sizes.TEXT_SIZE_14,
    );
    return AutoLoad(
      onInit: () async {
        await user.getUserQuestions(user.user.id);
        await user.getFollowings();
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
          child: CustomAppBar(
            hasTitle: true,
            title: "صفحتي الشخصية",
          ),
        ),
        drawer: MainMenu(),
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
                  height: assignHeight(context: context, fraction: 0.49),
                ),
                user.ProfileState == 0 ?
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
                    : user.ProfileState == 1 ?
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: user.qustionsProfileList.length, itemBuilder: (context, index) {
                      return _buildListCards(context,index,user);
                      },
                  )
                    : user.ProfileState == 2 ?
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
            CurvedContainer(
              backgroundColor: AppColors.greenblue2,
              bottomLeftRadius: Sizes.RADIUS_80,
              height: assignHeight(context: context, fraction: 0.495),
              child: Column(
                children: [
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        VerticalText(
                          onPressed: (){
                            ExtendedNavigator.root.push(Routes.followingScreen);
                          },
                          title: user.Followings==0 ? "_" : user.Followings == 1 ?  user.followingsList.length.toString() :"0",
                          subtitle: StringConst.FOLLOWING,
                          subtitleTextStyle: subtitleTextStyle,
                        ),
                        VerticalText(
                          onPressed: (){
                            ExtendedNavigator.root.push(Routes.userAnswersScreen);
                          },
                          title: "0",
                          subtitle: StringConst.ANSWERS,
                          subtitleTextStyle: subtitleTextStyle,
                        ),
                        VerticalText(
                          onPressed: (){
                            ExtendedNavigator.root.push(Routes.userQuestionsScreen);
                          },
                          title:user.ProfileState==0 ? "_" : user.ProfileState == 1 ?  user.qustionsProfileList.length.toString() :"0",
                          subtitle: StringConst.QUESTIONS,
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
                iconColor: AppColors.grey2,
                height: assignHeight(context: context, fraction: 0.37),
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
                        color: AppColors.blackFull,
                        fontSize: Sizes.SIZE_24,
                      ),
                      subtitle:  user.user.phone ,
                      subtitleTextStyle: theme.textTheme.bodyText1.copyWith(
                        color: AppColors.black60,
                        fontSize: Sizes.SIZE_20,
                      ),
                    ),
                    Text(
                      user.user.email,
                      style: theme.textTheme.headline5.copyWith(
                        color: AppColors.black60,
                        fontSize: Sizes.SIZE_20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.greenblue,
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
      children:[
        QuestionPostCard(
          headMainAxisAlignment: MainAxisAlignment.start,
          footerMainAxisAlignment: MainAxisAlignment.end,
          padding: const EdgeInsets.all(Sizes.PADDING_12),
          color: AppColors.greenligth,
          profileImagePath: ImagePath.MEN,
          auther: user.qustionsProfileList[index].LoginName,
          quationsTitel: user.qustionsProfileList[index].QuestionTitle,
          quationsContent: user.qustionsProfileList[index].QuestionContent,
          categoryName: user.qustionsProfileList[index].CategoryName,
          contentTextAlign: TextAlign.center,
          hasImage: true,
          contentImagePath: ImagePath.BREAKFAST,
          date: user.qustionsProfileList[index].CreatedOn.toString().replaceRange(10, user.qustionsProfileList[index].CreatedOn.toString().length, ""),
          titleStyle: headingStyle,
          subtitleStyle: contentStyle,
          contentStyle: contentStyle,
          iconTextStyle: iconTextStyle,
          iconColor: AppColors.black50,
          //onCommentsTap: ,
          numberOfComments: "0",
          // onDownVote: ,
          numberOfDownVotes: "0",
          // onUpVote: ,
          numberOfUpVotes: "0",
        ),
        SpaceH16(),
      ]
    );
  }
}
