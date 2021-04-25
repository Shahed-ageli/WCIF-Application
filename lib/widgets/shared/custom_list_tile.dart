import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_button.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';

class CustomListTile extends StatefulWidget {
  CustomListTile({
    @required this.title,
    @required this.imagePath,
    this.stars = 0,
    this.isFollowing = false,
  });

  final String title;
  final String imagePath;
  final int stars;
  final bool isFollowing;

  @override
  _CustomListTileState createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  bool isFollowing;

  @override
  void initState() {
    super.initState();
    isFollowing = widget.isFollowing;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: Sizes.PADDING_0,
        vertical: Sizes.PADDING_8,
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.all(
          const Radius.circular(
            Sizes.RADIUS_60,
          ),
        ),
        child: Image.asset(
          widget.imagePath,
          width: Sizes.WIDTH_56,
          height: Sizes.HEIGHT_56,
        ),
      ),
      title: Text(
        widget.title,
        style: theme.textTheme.subtitle1.copyWith(
          color: AppColors.greenblue,
        ),
      ),
      subtitle: Row(
        children: [
          Icon(
            Icons.star,
            color: AppColors.accentPurpleColor,
            size: Sizes.ICON_SIZE_14,
          ),
          SpaceW4(),
          Expanded(
            child: Text(
              "${widget.stars} ${StringConst.TRAVELLERS_STARS}",
              style: theme.textTheme.bodyText2.copyWith(
                color: AppColors.grey,
              ),
            ),
          ),
        ],
      ),
      trailing: Container(
        width: assignWidth(context: context, fraction: 0.25),
        height: Sizes.HEIGHT_42,
        child: CustomButton(
          borderRadius: Sizes.RADIUS_8,
          color: isFollowing ? AppColors.accentColor : AppColors.white,
          borderSide: isFollowing
              ? Borders.defaultPrimaryBorder
              : BorderSide(
            width: Sizes.WIDTH_1,
            color: AppColors.grey,
          ),
          elevation: Sizes.ELEVATION_0,
          onPressed: () => _toggleFollowButton(),
          title:
          isFollowing ? StringConst.FOLLOWING : StringConst.FOLLOW,
          textStyle: theme.textTheme.subtitle1.copyWith(
            color: isFollowing ? AppColors.white : AppColors.grey,
            fontSize: Sizes.TEXT_SIZE_12,
          ),
        ),
      ),
    );
  }

  void _toggleFollowButton() {
    setState(() {
      isFollowing = !isFollowing;
    });
  }
}
