import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/shared/pill.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';

import 'action_icon.dart';

class QuestionPostCard extends StatefulWidget {
  QuestionPostCard({
    this.height =340,
    this.width,
    this.borderRadius,
    this.decoration,
    this.padding,
    this.margin,
    this.color ,
    this.auther ,
    this.date,
    this.quationsTitel ,
    this.quationsContent,
    this.categoryName,
    this.profileImagePath ,
    this.onCommentsTap,
    this.numberOfComments,
    this.onUpVote,
    this.numberOfUpVotes,
    this.onDownVote,
    this.numberOfDownVotes,
    this.headMainAxisAlignment ,
    this.footerMainAxisAlignment,
    this.contentTextAlign,
    this.titleStyle,
    this.subtitleStyle,
    this.contentStyle,
    this.iconTextStyle,
    this.iconColor,
    this.hasImage ,
    this.contentImagePath,
  });

  final double height;
  final double width;
  final EdgeInsetsGeometry margin;
  final EdgeInsetsGeometry padding;
  final BoxDecoration decoration;
  final double borderRadius;
  final Color color;
  final String auther;
  final String date;
  final String quationsTitel;
  final String quationsContent;
  final String categoryName;
  final String profileImagePath;
  final String contentImagePath;
  final TextStyle titleStyle;
  final TextStyle subtitleStyle;
  final TextStyle contentStyle;
  final TextStyle iconTextStyle;
  final GestureTapCallback onCommentsTap;
  final String numberOfComments;
  final GestureTapCallback onUpVote;
  final String numberOfUpVotes;
  final GestureTapCallback onDownVote;
  final String numberOfDownVotes;
  final MainAxisAlignment headMainAxisAlignment;
  final MainAxisAlignment footerMainAxisAlignment;
  final TextAlign contentTextAlign;
  final bool hasImage;
  final Color iconColor;

  @override
  _QuestionPostCardState createState() => _QuestionPostCardState();
}

class _QuestionPostCardState extends State<QuestionPostCard> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: widget.width,
      height: widget.height ?? assignHeight(context: context, fraction: 0.3),
      margin: widget.margin,
      padding: widget.padding,
      decoration: widget.decoration ??
          BoxDecoration(
            color: widget.color,
            borderRadius: widget.borderRadius ??
                BorderRadius.all(
                  Radius.circular(Sizes.RADIUS_20),
                ),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: widget.headMainAxisAlignment,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.profileImagePath),
                minRadius: Sizes.RADIUS_20,
                maxRadius: Sizes.RADIUS_20,
              ),
              SpaceW16(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.auther,
                    style: widget.titleStyle ?? theme.textTheme.subtitle2,
                  ),
                  Text(
                    widget.date,
                    style: widget.subtitleStyle ??
                        theme.textTheme.bodyText1.copyWith(
                          color: AppColors.grey,
                          fontSize: Sizes.TEXT_SIZE_14,
                        ),
                  ),
                ],
              ),
            ],
          ),
          SpaceH8(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.quationsTitel,
                maxLines: 1,
                textAlign: widget.contentTextAlign,
                style: widget.contentStyle ??
                    theme.textTheme.bodyText1.copyWith(
                      fontSize: Sizes.TEXT_SIZE_14,
                  ),
              ),
              Text(
                widget.quationsContent,
                maxLines: 2,
                textAlign: widget.contentTextAlign,
                style: widget.contentStyle ??
                    theme.textTheme.bodyText1.copyWith(
                      fontSize: Sizes.TEXT_SIZE_14,
                    ),
              ),
            ],
          ),
          Row(
              mainAxisAlignment:MainAxisAlignment.center,
              children: [
                widget.hasImage ? SpaceH4() : Container(),
                widget.hasImage ? Image.asset(widget.contentImagePath) : Container(),
              ]
          ),
          SpaceH8(),
          Row(
            children: [
              Text(
                StringConst.QUESTION_CATEGORIES +" : ",
                style: widget.titleStyle,
              ),
              Pill(
                title: widget.categoryName,
                isSelected: true,
                unselectedBackgroundColor: AppColors.greenblue3,
                titleStyle:theme.textTheme.subtitle1.copyWith(
                  color: AppColors.white,
                ),
                isToggeled: false,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: widget.footerMainAxisAlignment,
            children: [
              ActionIcon(
                onTap: widget.onCommentsTap,
                title: widget.numberOfComments,
                iconData: FeatherIcons.messageSquare,
                isHorizontal: true,
                color: widget.iconColor,
                titleStyle: widget.iconTextStyle,
              ),
              SpaceW16(),
              ActionIcon(
                onTap: widget.onDownVote,
                title: widget.numberOfDownVotes,
                iconData: FeatherIcons.thumbsDown,
                isHorizontal: true,
                titleStyle: widget.iconTextStyle,
                color: widget.iconColor,
              ),
              SpaceW16(),
              ActionIcon(
                onTap: widget.onUpVote,
                title:  widget.numberOfUpVotes,
                iconData: FeatherIcons.thumbsUp,
                isHorizontal: true,
                titleStyle: widget.iconTextStyle,
                color: widget.iconColor,
              ),
              PopupMenuButton<int>(
                icon: Icon(
                  Icons.menu,
                  color:widget.iconColor,
                ),
                onSelected: (value)=>{callOnSelected(value)},
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 1,
                    child: Row(
                      children: [
                        Icon(
                          Icons.edit,
                          color:AppColors.black50,
                        ),
                        SpaceW4(),
                        Text("تعديل"),
                      ],
                    ),
                    enabled: true,
                  ),
                  PopupMenuItem(
                    value: 2,
                    child: Row(
                      children: [
                        Icon(Icons.delete,color:AppColors.black50),
                        SpaceW4(),
                        Text("حذف"),
                      ],
                    ),
                    enabled: false,
                  ),
                  PopupMenuItem(
                    value: 3,
                    child: Row(
                      children: [
                        Icon(
                            Icons.delete,
                            color:AppColors.black50,
                        ),
                        SpaceW4(),
                        Text("متابعة"),
                      ],
                    ),
                    enabled: false,
                  ),
                  PopupMenuItem(
                    value: 4,
                    child: Row(
                      children: [
                        Icon(Icons.delete,color:AppColors.black50),
                        SpaceW4(),
                        Text("إلغاء تفيل"),
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

callOnSelected(int value) {
  switch(value){
    case 1:
      print(1);
      break;
    case 2:
      print(2);
      break;
    case 3:
      print(3);
      break;
    case 4:
      print(4);
      break;
  }
}
