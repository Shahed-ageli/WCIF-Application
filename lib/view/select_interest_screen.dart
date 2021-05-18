import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
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
    InterestItem(StringConst.NATURE, ImagePath.SYNC),
    InterestItem(StringConst.FOOD, ImagePath.SYNC),
    InterestItem(StringConst.PEOPLE, ImagePath.SYNC),
    InterestItem(StringConst.ADVENTURE, ImagePath.SYNC),
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);
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
                color: AppColors.greenblue,
                fontSize:Sizes.SIZE_20,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: "name",
                  style: theme.textTheme.bodyText1.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppColors.greenblue,
                    fontSize:Sizes.SIZE_24,
                  ),
                ),
                TextSpan(
                  text: StringConst.INTEREST,
                  style: theme.textTheme.bodyText1.copyWith(
                    color: AppColors.greenblue,
                    fontSize:Sizes.SIZE_20,
                  ),
                ),
              ],
            ),
          ),
          SpaceH16(),
          Text(
            StringConst.SELECT_5,
            style: theme.textTheme.bodyText2.copyWith(
              color: AppColors.blackFull,
              fontSize:Sizes.SIZE_24
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
              ExtendedNavigator.root.push(Routes.loginScreen);
            },
            height: Sizes.HEIGHT_56,
            title: StringConst.SIGN_IN_now,
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
