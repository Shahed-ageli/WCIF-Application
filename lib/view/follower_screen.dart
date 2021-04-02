import 'package:auto_route/auto_route.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/search_input.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_button.dart';
import 'package:wcif_application/widgets/shared/custom_list_tile.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/values/values.dart';

class FollowerListItem {
  FollowerListItem({
    @required this.title,
    @required this.imagePath,
    this.stars,
  });

  final String title;
  final String imagePath;
  final int stars;
}

class FollowerScreen extends StatelessWidget {
  List<FollowerListItem> items = [
    FollowerListItem(
      title: StringConst.LESLIE,
      imagePath: RoamImagePath.LESLIE,
      stars: 31,
    ),
    FollowerListItem(
      title: StringConst.DARELL,
      imagePath: RoamImagePath.DARELL,
      stars: 17,
    ),
    FollowerListItem(
      title: StringConst.HAWKINS,
      imagePath: RoamImagePath.HAWKINS,
      stars: 27,
    ),
    FollowerListItem(
      title: StringConst.CODY,
      imagePath: RoamImagePath.CODY,
      stars: 27,
    ),
    FollowerListItem(
      title: StringConst.JANE,
      imagePath: RoamImagePath.JANE,
      stars: 9,
    ),
    FollowerListItem(
      title: StringConst.ESTHER,
      imagePath: RoamImagePath.ESTHER,
      stars: 18,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
        child: CustomAppBar(),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.PADDING_24,
          //vertical: Sizes.PADDING_36,
        ),
        children: [
          SpaceH16(),
          SearchInput(),
          SpaceH20(),
          Text(
            StringConst.FOLLOW_FRIENDS,
            style: theme.textTheme.bodyText1.copyWith(
              color: AppColors.secondaryColor,
              fontSize: Sizes.TEXT_SIZE_20,
            ),
          ),
          SpaceH20(),
          ..._buildFollowersList(items),
          SpaceH20(),
          // CustomButton(
          //   onPressed: () {
          //     //ExtendedNavigator.root.push(Routes.);
          //   },
          //   height: Sizes.HEIGHT_56,
          //   title: StringConst.FOLLOWING,
          //   borderRadius: Sizes.RADIUS_8,
          //   textStyle: theme.textTheme.subtitle1.copyWith(
          //     color: AppColors.white,
          //   ),
          // ),
        ],
      ),
    );
  }

  List<Widget> _buildFollowersList(List<FollowerListItem> itemList) {
    List<Widget> items = [];

    for (int index = 0; index < itemList.length; index++) {
      items.add(
        CustomListTile(
          title: itemList[index].title,
          imagePath: itemList[index].imagePath,
          stars: itemList[index].stars,
        ),
      );
    }
    return items;
  }
}
