import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/layout/auto_load.dart';
import 'package:wcif_application/widgets/shared/curved_app_bar.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/custom_button_2.dart';
import 'package:wcif_application/widgets/shared/question_post_card.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/shared/stacked_images.dart';

class CategoryQuestionsRequestScreen extends StatefulWidget {
  @override
  _CategoryQuestionsRequestScreenState createState() => _CategoryQuestionsRequestScreenState();
}

class _CategoryQuestionsRequestScreenState extends State<CategoryQuestionsRequestScreen> {
  @override
  Widget build(BuildContext context){
    final Map<int,String> args = ModalRoute.of(context).settings.arguments;
    ThemeData theme = Theme.of(context);
    var question = Provider.of<UserController>(context, listen: true);
    return AutoLoad(
      onInit: () async {
        // await question.searchCategory(args.values.first);
        // await question.getCategoryQuestions(args.keys.first.toString());
        // categoryData.CategoryShowed.clear();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
          child: CustomAppBar(
            hasTrailing: false,
            hasTitle: true,
            title: question.searchCategortState == 1  ? question.searchCategoryList.first.CategoryName : "اسم الفئة",
          ),
        ),
        body:Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.PADDING_16,
                  ),
                  child: ListView(
                      children: [
                        SizedBox(
                          height: 200,
                        ),
                        question.categoryQuestionsState == 1 && question.categoryQuestionsList.length != 0 ?
                        ListView(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.PADDING_16,
                            vertical: Sizes.PADDING_16,
                          ),
                          shrinkWrap: true,
                          children: [
                            ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: question.categoryQuestionsList.length,
                              itemBuilder: (context, index) {
                                return _buildQuestionPostCard(context,index,question);
                              },
                            ),
                          ],
                        )
                            :question.categoryQuestionsState == 0 ?
                        Column(
                            children: [
                              Text(
                                StringConst.INLOAD,
                                style: theme.textTheme.bodyText1.copyWith(
                                  color: AppColors.black,
                                  fontSize:Sizes.SIZE_20,
                                ),
                              ),
                              Image.asset(ImagePath.LOAD)
                            ])
                            :question.categoryQuestionsState == 2 ?
                        Container(
                          child: Text(
                            StringConst.PROBLEM_IN_LOAD,
                            style: theme.textTheme.headline5.copyWith(
                              color: AppColors.bluegreen,
                              fontSize: Sizes.TEXT_SIZE_28,
                            ),
                          ),
                        )
                            : question.categoryQuestionsList.length == 0 ?
                        Column(
                            children: [
                              Text(
                                "لا يوجد اسئلة في هذه الفئة",
                                style: theme.textTheme.headline5.copyWith(
                                  color: AppColors.bluegreen,
                                  fontSize: Sizes.TEXT_SIZE_28,
                                ),
                              ),
                              Image.asset(
                                ImagePath.QUESTION4,
                                fit: BoxFit.fill,
                              ),
                            ]
                        )
                            : Text(""),
                      ]
                  )
              ),
              CurvedAppBar(
                backgroundColor: AppColors.greenligth2,
                bottomLeftRadius: Sizes.RADIUS_80,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                height: 200,
                title:Column(
                  children: [
                    Row(
                      children: [
                        SpaceW8(),
                        ClipRRect(
                          borderRadius:const BorderRadius.all(
                            const Radius.circular(
                              Sizes.RADIUS_8,
                            ),
                          ),
                          child:
                          Image.asset(
                            question.searchCategortState == 1 ?
                            CategoryImages.Images[question.searchCategoryList.first.CategoryName]
                                : ImagePath.SYNC,
                            fit: BoxFit.fill,
                            height: 180,
                            width: 150,
                          ),
                        ),
                        SpaceW8(),
                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  CustomButton2 (
                                    hasText: true,
                                    text: "عرض الاسئلة",
                                    onPressed: () {},
                                    borderRadius: Sizes.RADIUS_20,
                                    iconColor:AppColors.white,
                                    icon: FontAwesomeIcons.paperPlane,
                                    iconSize: Sizes.ICON_SIZE_12,
                                  ),
                                  SpaceW20(),
                                ],
                              ),
                              SpaceH4(),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children:[
                                    Text(
                                      question.searchCategortState == 1 ?
                                      question.searchCategoryList.first.CategoryName
                                          : "اسم الفئة",
                                      overflow: TextOverflow.ellipsis,
                                      style: theme.textTheme.subtitle1.copyWith(
                                        color: AppColors.bluegreen,
                                        fontSize: Sizes.SIZE_24,
                                      ),
                                    ),
                                    SpaceW2(),
                                  ]
                              ),
                              SpaceH40(),
                              Row(
                                children: [
                                  Text(
                                    "طلبات الاسئلة على هذه الفئة",
                                    overflow: TextOverflow.ellipsis,
                                    style: theme.textTheme.bodyText2.copyWith(
                                      color: AppColors.black,
                                      fontSize: Sizes.TEXT_SIZE_12,
                                    ),
                                  ),
                                  SpaceW4(),
                                  StackedImages(
                                    extraImagesLength: question.categoryQuestionsState == 1 ?
                                    question.categoryQuestionsList.length
                                        : 0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }

  @swidget
  Widget _buildQuestionPostCard(BuildContext  context,int index,UserController question) {
    ThemeData theme = Theme.of(context);
    TextStyle headingStyle = theme.textTheme.subtitle2.copyWith(
      color: AppColors.black,
      fontSize: Sizes.TEXT_SIZE_14,
      fontWeight: FontWeight.bold,
    );
    TextStyle contentStyle = theme.textTheme.bodyText1.copyWith(
      color: AppColors.black,
      fontSize: Sizes.TEXT_SIZE_16,
      fontWeight: FontWeight.bold,
    );
    TextStyle iconTextStyle = theme.textTheme.subtitle1.copyWith(
      color: AppColors.black,
      fontWeight: FontWeight.bold,
    );
    return Column(
        children:[
          QuestionPostCard(
            headMainAxisAlignment: MainAxisAlignment.start,
            footerMainAxisAlignment: MainAxisAlignment.end,
            padding: const EdgeInsets.all(Sizes.PADDING_12),
            color: AppColors.greenligth,
            profileImagePath: ImagePath.WOMAN,
            auther: question.categoryQuestionsList[index].LoginName,
            quationsTitel: question.categoryQuestionsList[index].QuestionTitle,
            quationsContent:question.categoryQuestionsList[index].QuestionContent,
            categoryName: question.categoryQuestionsList[index].CategoryName,
            contentTextAlign: TextAlign.center,
            hasImage: true,
            contentImagePath: ImagePath.BREAKFAST,
            date: question.categoryQuestionsList[index].CreatedOn.toString().replaceRange(10, question.categoryQuestionsList[index].CreatedOn.toString().length, ""),
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




