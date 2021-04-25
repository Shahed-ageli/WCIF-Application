import 'package:auto_route/auto_route.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/main_menu.dart';
import 'package:wcif_application/widgets/shared/search_input.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_button.dart';
import 'package:wcif_application/widgets/shared/custom_list_tile.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/values/values.dart';

class FollowingListItem {
  FollowingListItem({
    @required this.title,
    @required this.imagePath,
    this.stars,
  });

  final String title;
  final String imagePath;
  final int stars;
}

class FollowingScreen extends StatelessWidget {
  List<FollowingListItem> items = [
    FollowingListItem(
      title: StringConst.LESLIE,
      imagePath: ImagePath.LESLIE,
      stars: 31,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return DefaultTabController(
      length: 2,
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
              SpaceH20(),
              Text(
                StringConst.SEARCHUSER,
                style: theme.textTheme.bodyText1.copyWith(
                  color: AppColors.greenblue,
                  fontSize: Sizes.TEXT_SIZE_20,
                ),
              ),
              SpaceH20(),
              SearchInput(),
              SpaceH20(),
             // Text(
             //      "",
             //      style: theme.textTheme.bodyText1.copyWith(
             //        color: AppColors.greenblue,
             //        fontSize: Sizes.TEXT_SIZE_20,
             //      ),
             // ),
              SpaceH20(),
              TabBar(
                labelColor: AppColors.primaryColor,
                labelStyle: theme.textTheme.subtitle1.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: Sizes.TEXT_SIZE_14,
                ),
                labelPadding: EdgeInsets.zero,
                unselectedLabelColor: AppColors.blackShade5,
                indicatorSize: TabBarIndicatorSize.label,
                tabs: [
                  Tab(
                    text: StringConst.FOLLOWERS,
                  ),
                  Tab(
                    text: StringConst.FOLLOWING,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildFollowersList(items),
                    _buildFollowersList(items),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFollowersList(List<FollowingListItem> itemList) {
    return ListView.separated(
      itemCount: itemList.length,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (BuildContext context, int index) {
        return CustomListTile(
          title: itemList[index].title,
          imagePath: itemList[index].imagePath,
          stars: itemList[index].stars,
        );
      },
    );
  }
}
