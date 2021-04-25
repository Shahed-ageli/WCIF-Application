import 'package:auto_route/auto_route.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';

import 'action_icon.dart';

class QuestionPostCard extends StatelessWidget {
  QuestionPostCard({
    this.height,
    this.width,
    this.borderRadius,
    this.decoration,
    this.padding,
    this.margin,
    this.color = AppColors.white,
    this.title = StringConst.JAMILA,
    this.subTitle = StringConst.DATE,
    this.content = StringConst.LOREM_IPSUM,
    this.profileImagePath = ImagePath.AMIR,
    this.onCommentsTap,
    this.onLike,
    this.onShare,
    this.headMainAxisAlignment = MainAxisAlignment.start,
    this.footerMainAxisAlignment = MainAxisAlignment.start,
    this.contentTextAlign,
    this.titleStyle,
    this.subtitleStyle,
    this.contentStyle,
    this.iconTextStyle,
    this.canShare = true,
    this.iconColor,
    this.hasImage = false,
    this.contentImagePath,
  });

  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BoxDecoration decoration;
  final double borderRadius;
  final Color color;
  final String title;
  final String subTitle;
  final String content;
  final String profileImagePath;
  final String contentImagePath;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final TextStyle contentStyle;
  final TextStyle iconTextStyle;
  final GestureTapCallback onShare;
  final GestureTapCallback onCommentsTap;
  final GestureTapCallback onLike;
  final MainAxisAlignment headMainAxisAlignment;
  final MainAxisAlignment footerMainAxisAlignment;
  final TextAlign contentTextAlign;
  final bool canShare;
  final bool hasImage;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: width,
      height: height ?? assignHeight(context: context, fraction: 0.3),
      margin: margin,
      padding: padding,
      decoration: decoration ??
          BoxDecoration(
            color: color,
            borderRadius: borderRadius ??
                BorderRadius.all(
                  Radius.circular(Sizes.RADIUS_20),
                ),
          ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: headMainAxisAlignment,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(profileImagePath),
                minRadius: Sizes.RADIUS_20,
                maxRadius: Sizes.RADIUS_20,
              ),
              SpaceW16(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle ?? theme.textTheme.subtitle2,
                  ),
                  Text(
                    subTitle,
                    style: subtitleStyle ??
                        theme.textTheme.bodyText1.copyWith(
                          color: AppColors.grey,
                          fontSize: Sizes.TEXT_SIZE_14,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SpaceH16(),
          Expanded(
            child: Text(
              content,
              maxLines: 4,
              textAlign: contentTextAlign,
              style: contentStyle ??
                  theme.textTheme.bodyText1.copyWith(
                    fontSize: Sizes.TEXT_SIZE_14,
                  ),
            ),
          ),
          hasImage ? SpaceH4() : Container(),
          hasImage ? Image.asset(contentImagePath) : Container(),
          SpaceH16(),
          Row(
            mainAxisAlignment: footerMainAxisAlignment,
            children: [
              canShare
                  ? InkWell(
                onTap: onShare,
                child: Icon(FeatherIcons.navigation, color: AppColors.grey),
              )
                  : Container(),
              canShare ? Spacer() : Container(),
              ActionIcon(
                onTap: onCommentsTap,
                title: StringConst.NUMBER_OF_COMMENTS,
                iconData: FeatherIcons.messageSquare,
                isHorizontal: true,
                color: iconColor,
                titleStyle: iconTextStyle,
              ),
              SpaceW16(),
              ActionIcon(
                onTap: onLike,
                title: StringConst.NUMBER_OF_LIKES,
                iconData: FeatherIcons.thumbsDown,
                isHorizontal: true,
                titleStyle: iconTextStyle,
                color: iconColor,
              ),
              SpaceW16(),
              ActionIcon(
                onTap: onLike,
                title: StringConst.NUMBER_OF_LIKES,
                iconData: FeatherIcons.thumbsUp,
                isHorizontal: true,
                titleStyle: iconTextStyle,
                color: iconColor,
              ),
              PopupMenuButton<int>(
                icon: Icon(
                  Icons.menu,
                  color:iconColor,
                ),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(Icons.edit,color:AppColors.purpleH),
                        SpaceW8(),
                        Text("تعديل"),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(Icons.delete,color:AppColors.purpleH),
                        SpaceW8(),
                        Text("حذف"),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
