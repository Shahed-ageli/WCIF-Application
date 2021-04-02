import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_button.dart';
import 'package:wcif_application/widgets/shared/interest_card.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/values/values.dart';

class InterestItem {
  InterestItem(this.title, this.imagePath);
  final String title;
  final String imagePath;
}

class SelectInterestScreen extends StatelessWidget {
  List<InterestItem> items = [
    InterestItem(StringConst.NATURE, RoamImagePath.THAILAND),
    InterestItem(StringConst.SPORT, RoamImagePath.THAILAND),
    InterestItem(StringConst.FOOD, RoamImagePath.FOOD),
    InterestItem(StringConst.PEOPLE, RoamImagePath.PEOPLE),
    InterestItem(StringConst.ADVENTURE, RoamImagePath.GREAT_WALL),
    InterestItem(StringConst.WILDLIFE, RoamImagePath.WILDLIFE),
    InterestItem(StringConst.CULTURE, RoamImagePath.VIETNAM_2),
    InterestItem(StringConst.BEACH, RoamImagePath.BEACHES_BALI),
    InterestItem(StringConst.MOUNTAIN, RoamImagePath.MOUNTAIN),
    InterestItem(StringConst.HEALTH, RoamImagePath.URBAN),
    InterestItem(StringConst.EDUCATION, RoamImagePath.RESORTS),
    InterestItem(StringConst.ANIMAL, RoamImagePath.RESORTS),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.PADDING_24,
          vertical: Sizes.PADDING_36,
        ),
        children: [
          RichText(
            text: TextSpan(
              text: StringConst.HELLO,
              style: theme.textTheme.bodyText1.copyWith(
                color: AppColors.secondaryColor,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: StringConst.KRISTIN,
                  style: theme.textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor,
                  ),
                ),
                TextSpan(
                  text: StringConst.INTEREST,
                  style: theme.textTheme.bodyText1.copyWith(
                    color: AppColors.secondaryColor,
                  ),
                ),
              ],
            ),
          ),
          SpaceH16(),
          Text(
            StringConst.SELECT_5,
            style: theme.textTheme.bodyText2.copyWith(
              color: AppColors.grey,
            ),
          ),
          SpaceH16(),
          Wrap(
            spacing: Sizes.SIZE_16,
            runSpacing: Sizes.SIZE_16,
            children: _buildInterests(items),
          ),
          SpaceH24(),
          CustomButton(
            onPressed: () {

              ExtendedNavigator.root.push(Routes.menuScreen);
            },
            height: Sizes.HEIGHT_56,
            title: StringConst.Conect,
            borderRadius: Sizes.RADIUS_8,
            textStyle: theme.textTheme.subtitle1.copyWith(
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildInterests(List<InterestItem> itemList) {
    List<Widget> items = [];

    for (int index = 0; index < itemList.length; index++) {
      items.add(
        InterestCard(
          title: itemList[index].title,
          imagePath: itemList[index].imagePath,
        ),
      );
    }
    return items;
  }
}
