import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'package:functional_widget_annotation/functional_widget_annotation.dart';
import 'package:wcif_application/widgets/shared/search_input.dart';
import 'curved_container.dart';

class CurvedAppBar extends StatelessWidget {
  CurvedAppBar({
    this.height,
    this.borderRadius,
    this.iconColor,
    this.iconSize = Sizes.SIZE_24,
    // this.leadingIcon = Icons.arrow_back,
    // this.trailingIcon = Icons.search,
    this.leading,
    this.trailing,
    this.onLeadingTap,
    this.onTrailingTap,
    this.hasLeading = true,
    this.hasTrailing = false,
    this.backgroundColor = AppColors.greenblue2,
    this.margin,
    this.decoration,
    this.topLeftRadius = Sizes.RADIUS_0,
    this.topRightRadius = Sizes.RADIUS_0,
    this.bottomRightRadius = Sizes.RADIUS_0,
    this.bottomLeftRadius = Sizes.RADIUS_0,
    this.mainAxisAlignment = MainAxisAlignment.spaceAround,
    this.crossAxisAlignment = CrossAxisAlignment.stretch,
    this.boxShadow,
    this.title,
});

  final double height;
  final Widget leading;
  final Widget trailing;
  final GestureTapCallback onLeadingTap;
  final GestureTapCallback onTrailingTap;
  final bool hasLeading;
  final bool hasTrailing;
  final Color backgroundColor;
  // final IconData leadingIcon;
  // final IconData trailingIcon;
  final Color iconColor;
  final double iconSize;
  final BorderRadiusGeometry borderRadius;
  final BoxDecoration decoration;
  final EdgeInsetsGeometry margin;
  final double topLeftRadius;
  final double topRightRadius;
  final double bottomRightRadius;
  final double bottomLeftRadius;
  final BoxShadow boxShadow;
  final MainAxisAlignment mainAxisAlignment;
  final CrossAxisAlignment crossAxisAlignment;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return CurvedContainer(
      margin: margin,
      height: height ?? assignHeight(context: context, fraction: 0.15),
      decoration: decoration,
      backgroundColor: backgroundColor,
      borderRadius: borderRadius,
      topLeftRadius: topLeftRadius,
      topRightRadius: topRightRadius,
      bottomLeftRadius: bottomLeftRadius,
      bottomRightRadius: bottomRightRadius,
      boxShadow: [boxShadow ?? BoxShadow()],
      child: Column(
        mainAxisAlignment: mainAxisAlignment,
        crossAxisAlignment: crossAxisAlignment,
        children: [
          //SpaceH63(),
          // (hasLeading == false && hasTrailing == false)
          //     ? Spacer()
          //     : Container(
          //   padding: EdgeInsets.only(
          //     left: Sizes.PADDING_16,
          //     right: Sizes.PADDING_16,
          //     top: Sizes.SAFE_AREA_MARGIN + Sizes.PADDING_8,
          //   ),
            // child: Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     hasLeading
            //         ? (leading ?? defaultLeading(context))
            //         : Spacer(),
            //     hasTrailing
            //         ? (trailing ?? defaultTrailing())
            //         : Container(),
            //   ],
            // ),
          // ),
          title ?? Container(),
        ],
      ),
    );
  }

  // @swidget
  // Widget defaultLeading(BuildContext context) {
  //   return InkWell(
  //     onTap: onLeadingTap ?? () => ExtendedNavigator.root.pop(),
  //     child: Icon(
  //       leadingIcon,
  //       color: iconColor,
  //       size: iconSize,
  //     ),
  //   );
  // }
  //
  // @swidget
  // Widget defaultTrailing() {
  //   return InkWell(
  //     onTap: onTrailingTap,
  //     child: Icon(
  //       trailingIcon,
  //       color: iconColor,
  //       size: iconSize,
  //     ),
  //   );
  // }
}
