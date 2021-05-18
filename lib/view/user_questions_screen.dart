import 'package:flutter/material.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/values/values.dart';
import 'file:///C:/Users/ielsh/AndroidStudioProjects/wcif_application/lib/widgets/layout/auto_load.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/question_post_card.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';

class UserQuestionsScreen extends StatefulWidget {
  @override
  _UserQuestionsScreenState createState() => _UserQuestionsScreenState();
}

class _UserQuestionsScreenState extends State<UserQuestionsScreen> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);
    return AutoLoad(
      onInit: () async {
        await user.getUserQuestions(user.user.id);
        },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
          child: CustomAppBar(
            hasTrailing: false,
            hasTitle: true,
            title: "أسئلتي",
          ),
        ),
        body:ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.PADDING_16,
            vertical: Sizes.PADDING_16,
          ),
          shrinkWrap: true,
          children: [
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
              itemCount: user.qustionsProfileList.length,
              itemBuilder: (context, index) {
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
