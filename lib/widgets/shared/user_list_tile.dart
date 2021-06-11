import 'package:flutter/material.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/widgets/shared/custom_button.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';

class CustomListTile extends StatefulWidget {
  CustomListTile({
    @required this.name,
    @required this.email,
    @required this.userId,
    @required this.follow,
    @required this.imagePath,
    this.isFollowing = false,
  });

  final String name;
  final String email;
  final String userId;
  final UserController follow;
  final String imagePath;
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
        widget.name,
        style: theme.textTheme.subtitle1.copyWith(
          color: AppColors.greenblue,
          fontSize: Sizes.TEXT_SIZE_20,

        ),
      ),
      subtitle: Text(
        widget.email,
        maxLines: 2,
        style: theme.textTheme.bodyText2.copyWith(
          color: AppColors.black60,
          fontWeight: FontWeight.bold,
          fontSize: Sizes.TEXT_SIZE_14,
        ),
      ),
      trailing: Container(
        width: assignWidth(context: context, fraction: 0.25),
        height: Sizes.HEIGHT_42,
        child: CustomButton(
          borderRadius: Sizes.RADIUS_8,
          color: isFollowing ? AppColors.greenblue3 : AppColors.white,
          borderSide: isFollowing
              ? Borders.defaultPrimaryBorder
              : BorderSide(
            width: Sizes.WIDTH_1,
            color: AppColors.grey,
          ),
          elevation: Sizes.ELEVATION_0,
          onPressed: () => _toggleFollowButton(widget.follow,widget.userId),
          title: isFollowing ? StringConst.UNFOLLOW : StringConst.FOLLOW,
          textStyle: theme.textTheme.subtitle1.copyWith(
            color: isFollowing ? AppColors.white : AppColors.grey,
            fontSize: Sizes.TEXT_SIZE_12,
          ),
        ),
      ),
    );
  }

  void _toggleFollowButton(UserController follow, String Id) {
    if(isFollowing){
      follow.unFollowUser(Id);
      follow.getFollowers();
      follow.getFollowings();
    }else{
      follow.followUser(Id);
      follow.getFollowers();
      follow.getFollowings();
    }
    setState(() {
      isFollowing = !isFollowing;
    });
  }
}