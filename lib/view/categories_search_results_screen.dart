import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/main_menu.dart';
import 'package:wcif_application/widgets/shared/search_input.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/values/values.dart';

class CategoriesSearchScreen extends StatefulWidget {
  @override
  _CategoriesSearchScreenState createState() => _CategoriesSearchScreenState();
}

class _CategoriesSearchScreenState extends State<CategoriesSearchScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
          child: CustomAppBar(),
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
              Text(
                "StringConst.SEARCHCATEGORY",
                style: theme.textTheme.bodyText1.copyWith(
                  color: AppColors.greenblue,
                  fontSize: Sizes.TEXT_SIZE_20,
                ),
              ),
              SpaceH16(),
              // SearchInput(),
              SpaceH20(),
              Text(
                StringConst.CATEGORIES,
                style: theme.textTheme.headline5.copyWith(
                  color: AppColors.bluegreen,
                  fontSize: Sizes.TEXT_SIZE_28,
                ),
              ),
              SpaceH20(),
              TabBar(
                //labelColor: AppColors.primaryColor,
                labelStyle: theme.textTheme.subtitle1.copyWith(
                  //color: AppColors.primaryColor,
                  fontSize: Sizes.TEXT_SIZE_14,
                ),
                labelPadding: EdgeInsets.zero,
                //unselectedLabelColor: AppColors.blackShade6,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    text: "StringConst.ALLCATEGORIES",
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


}
