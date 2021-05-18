import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';

import 'action_icon.dart';

class AnswerPostCard extends StatelessWidget {
  AnswerPostCard({
    this.height,
    this.width,
    this.borderRadius,
    this.decoration,
    this.padding,
    this.margin,
    this.color = AppColors.white,
    this.title ,
    this.subTitle,
    this.content,
    this.profileImagePath ,
    this.headMainAxisAlignment = MainAxisAlignment.start,
    this.footerMainAxisAlignment = MainAxisAlignment.start,
    this.contentTextAlign,
    this.titleStyle,
    this.subtitleStyle,
    this.contentStyle,
    this.onLike,
    this.iconTextStyle,
    this.iconColor,
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
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final TextStyle contentStyle;
  final MainAxisAlignment headMainAxisAlignment;
  final MainAxisAlignment footerMainAxisAlignment;
  final TextAlign contentTextAlign;
  final GestureTapCallback onLike;
  final TextStyle iconTextStyle;
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
              )
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
          SpaceH16(),
          Row(
            mainAxisAlignment: footerMainAxisAlignment,
            children: [
              ActionIcon(
                onTap: onLike,
                title: "0",
                iconData: FeatherIcons.thumbsDown,
                isHorizontal: true,
                titleStyle: iconTextStyle,
                color: iconColor,
              ),
              SpaceW16(),
              ActionIcon(
                onTap: onLike,
                title: "0",
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
                        Icon(Icons.edit,color:AppColors.black50),
                        SpaceW8(),
                        Text("تعديل"),
                      ],
                    ),
                    enabled: false,
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(Icons.delete,color:AppColors.black50),
                        SpaceW8(),
                        Text("حذف"),
                      ],
                    ),
                    enabled: false,
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Row(
                      children: [
                        Icon(Icons.delete,color:AppColors.black50),
                        SpaceW8(),
                        Text("تعيين مقبولة"),
                      ],
                    ),
                    enabled: false,
                  ),
                  PopupMenuItem(
                    value: 4,
                    child: Row(
                      children: [
                        Icon(Icons.delete,color:AppColors.black50),
                        SpaceW8(),
                        Text("حذف"),
                      ],
                    ),
                    enabled: false,
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
