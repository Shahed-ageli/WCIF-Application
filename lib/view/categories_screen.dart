import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/saved_paces_card.dart';
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
          child: CustomAppBar(),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: kSidePadding,
            vertical: Sizes.PADDING_8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConst.CATEGORIES,
                style: theme.textTheme.headline5.copyWith(
                  color: AppColors.primaryColor,
                  fontSize: Sizes.TEXT_SIZE_28,
                ),
              ),
              SpaceH16(),
              SearchInput(),
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
                    text: StringConst.ATTRACTIONS,
                  ),
                  Tab(
                    text: StringConst.HOTELS,
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _buildSavedPlacesCards(),
                    _buildSavedPlacesCards(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSavedPlacesCards() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      itemCount: RoamData.savedPlacesItems.length,
      padding: EdgeInsets.only(top: Sizes.PADDING_16),
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) {
        return SavedPlacesCard(
          imagePath: RoamData.savedPlacesItems[index].imagePath,
          title: RoamData.savedPlacesItems[index].title,
          subtitle: RoamData.savedPlacesItems[index].subtitle,
          images: RoamData.profileStackedImage,
          likes: RoamData.savedPlacesItems[index].likes,
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return SpaceH16();
      },
    );
  }
}
