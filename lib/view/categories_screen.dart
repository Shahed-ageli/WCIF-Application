import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/widgets/layout/auto_load.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/main_menu.dart';
import 'package:wcif_application/widgets/shared/category_card.dart';
import 'package:wcif_application/widgets/shared/search_input.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/values/values.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var category = Provider.of<UserController>(context, listen: true);
    return AutoLoad(
      onInit: () async {
        await category.getCategory();
        await category.getModeratorCategory();
        categoryData.CategoryShowed.clear();
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
            child: CustomAppBar(
              hasTitle: true,
              title: StringConst.CATEGORIES,
            ),
          ),
          drawer: MainMenu(),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kSidePadding,
              vertical: Sizes.PADDING_8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceH12(),
                SearchInput(
                  controller: category.searchCategoryController,
                  title:StringConst.SEARCH_CATEGORY ,
                ),
                SpaceH12(),
                Text(
                  StringConst.CATEGORIES,
                  style: theme.textTheme.headline5.copyWith(
                    color: AppColors.greenblue,
                    fontSize: Sizes.TEXT_SIZE_28,
                  ),
                ),
                SpaceH12(),
                TabBar(
                  labelColor: AppColors.greenblue2,
                  labelStyle: theme.textTheme.subtitle1.copyWith(
                    color: AppColors.bluegreen,
                    fontSize: Sizes.TEXT_SIZE_14,
                  ),
                  labelPadding: EdgeInsets.zero,
                  unselectedLabelColor: AppColors.black60,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      text: StringConst.ALL_CATEGORIES,
                    ),
                    Tab(
                      text: StringConst.MODERATOR_CATEGORIES,
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ////////////////////////////////////////first Tap
                      category.categoryState == 0 ?
                      SingleChildScrollView(
                        child: Column(
                            children: [
                              Text(
                                StringConst.INLOAD,
                                style: theme.textTheme.headline5.copyWith(
                                  color: AppColors.bluegreen,
                                  fontSize: Sizes.TEXT_SIZE_28,
                                ),
                              ),
                              Image.asset(
                                ImagePath.LOAD,
                                fit: BoxFit.fill,
                              ),
                            ]
                        ),
                      )
                          : category.categoryState == 1 ?
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: category.categoryList.length,
                        padding: EdgeInsets.only(top: Sizes.PADDING_16),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryCard(
                            hasImg: (CategoryImages.Images[category.categoryList[index].CategoryName]) == null ?false:true,
                            imagePath: CategoryImages.Images[category.categoryList[index].CategoryName],
                            name: category.categoryList[index].CategoryName,
                            description:category.categoryList[index].Description,
                            id: category.categoryList[index].Id,
                            bottonText: StringConst.SHOW,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SpaceH12();
                        },
                      )
                          : category.categoryState == 2 ?
                      Container(
                        child: Text(
                          StringConst.PROBLEM_IN_LOAD,
                          style: theme.textTheme.bodyText1.copyWith(
                            color: AppColors.black,
                            fontSize: Sizes.SIZE_20,
                          ),
                        ),
                      )
                          : Container(),
                      ////////////////////////////////////////////// second tap
                      category.isModerator==false && category.moderatorState == 1 ?
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            SpaceH20(),
                            Text(
                              StringConst.NOT_MODERATOR_IN_ANY_CATEGORR,
                              style: theme.textTheme.headline5.copyWith(
                                color: AppColors.bluegreen,
                                fontSize: Sizes.TEXT_SIZE_28,
                              ),
                            ),
                            Image.asset(
                              ImagePath.MODERATOER,
                              fit: BoxFit.fill,
                            ),
                          ],
                        ),
                      )
                      :category.moderatorState == 0 ?
                      Column(
                          children: [
                            Text(
                              StringConst.INLOAD,
                              style: theme.textTheme.headline5.copyWith(
                                color: AppColors.bluegreen,
                                fontSize: Sizes.TEXT_SIZE_28,
                              ),
                            ),
                            Image.asset(
                              ImagePath.LOAD,
                              fit: BoxFit.fill,
                            ),
                          ]
                      )
                          : category.isModerator==true && category.moderatorState == 1 ?
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: category.moderatorCategoryDescriptionList.length,
                        padding: EdgeInsets.only(top: Sizes.PADDING_16),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryCard(
                            hasImg: (CategoryImages.Images[category.moderatorCategoryDescriptionList[index].CategoryName]) == null ?false:true,
                            imagePath: CategoryImages.Images[category.moderatorCategoryDescriptionList[index].CategoryName],
                            name: category.moderatorCategoryDescriptionList[index].CategoryName,
                            description:category.moderatorCategoryDescriptionList[index].Description,
                            id: category.moderatorCategoryDescriptionList[index].Id,
                            bottonText: StringConst.SHOW_QUESTION_REQ,
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SpaceH12();
                        },
                      )

                          : category.moderatorState == 2 ?
                      Container(
                        child: Text(
                          StringConst.PROBLEM_IN_LOAD,
                          style: theme.textTheme.bodyText1.copyWith(
                            color: AppColors.black,
                            fontSize: Sizes.SIZE_20,
                          ),
                        ),
                      )
                          : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}