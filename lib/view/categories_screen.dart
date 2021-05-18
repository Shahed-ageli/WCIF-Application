import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'file:///C:/Users/ielsh/AndroidStudioProjects/wcif_application/lib/widgets/layout/auto_load.dart';
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

const Map<String,String> Images = {
  "مطاعم ":CategoryImage.resturant,
  "الاطباء":CategoryImage.doctors,
  "التعليم":CategoryImage.student,
  "صيدليات ومستشفيات":CategoryImage.medical,
  "محلات واسواق": CategoryImage.shopping2,
  "طبخ": CategoryImage.cooking,
  "رياضة":CategoryImage.sport,
  "الالعاب":CategoryImage.game,
  "الحيوانات":CategoryImage.animal,
  "الالكترونيات": CategoryImage.devices,
  "برمجة": CategoryImage.programming2,
};

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);
    return AutoLoad(
      onInit: () async {
        await user.getCategory();
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
                Text(
                  StringConst.SEARCH_CATEGORY,
                  style: theme.textTheme.bodyText1.copyWith(
                    color: AppColors.greenblue,
                    fontSize: Sizes.TEXT_SIZE_20,
                  ),
                ),
                SpaceH12(),
                SearchInput(),
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
                    children: [
                      user.CategortState == 0?
                      Column(
                          children: [
                            Text(
                              StringConst.INLOAD,
                              style: theme.textTheme.bodyText1.copyWith(
                                color: AppColors.blackFull,
                                fontSize: Sizes.SIZE_20,
                              ),
                            ),
                            Image.asset(ImagePath.LOAD)
                          ])
                          : user.CategortState == 1 ?
                      ListView.separated(
                        scrollDirection: Axis.vertical,
                        itemCount: user.categoryList.length,
                        padding: EdgeInsets.only(top: Sizes.PADDING_16),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return CategoryCard(
                            hasImg: (Images[user.categoryList[index].CategoryName])==null ?  false:true ,
                            imagePath: Images[user.categoryList[index].CategoryName],
                            name: user.categoryList[index].CategoryName,
                            description:user.categoryList[index].Description,
                            Questions: 2,

                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SpaceH12();
                        },
                      )
                          : user.CategortState == 2 ?
                      Container(
                        child: Text(
                          StringConst.PROBLEM_IN_LOAD,
                          style: theme.textTheme.bodyText1.copyWith(
                            color: AppColors.blackFull,
                            fontSize: Sizes.SIZE_20,
                          ),
                        ),
                      )
                          : Container(),
                      Column(
                        children: [
                          SpaceH20(),
                          Center(
                            child: Text(
                              StringConst.NOT_MODERATOR_IN_ANY_CATEGORR,
                              style: theme.textTheme.headline5.copyWith(
                                color: AppColors.bluegreen,
                                fontSize: Sizes.TEXT_SIZE_28,
                              ),
                            ),
                          ),
                        ],
                      ),
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