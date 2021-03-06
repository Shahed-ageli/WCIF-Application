import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:wcif_application/values/values.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    this.title,
    this.hasLeading = true,
    this.hasTrailing = true,
    this.hasTitle = false,
    this.onActionTap,
    this.color = AppColors.greenblue,
    this.trailing,
    this.leadingColor,
    this.trailingColor,
    this.leading,
    this.onLeadingTap,
  });

  final GestureTapCallback onLeadingTap;
  final GestureTapCallback onActionTap;
  final List<Widget> trailing;
  final Widget leading;
  final Color color;
  final Color leadingColor;
  final Color trailingColor;
  final bool hasLeading;
  final bool hasTrailing;
  final bool hasTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return AppBar(
      elevation: 0.0,
      backgroundColor: color,
     // leading: hasLeading ? (leading ?? defaultLeading()) : null,
      centerTitle: true,
      title: hasTitle
          ? Text(
        title,
        style: theme.textTheme.subtitle1.copyWith(
          color: AppColors.white,
          fontSize: Sizes.TEXT_SIZE_20,
          fontWeight: FontWeight.bold,
        ),
      )
          : null,
      actions: hasTrailing ? (trailing ?? defaultTrailing()) : null,
    );
  }

  List<Widget> defaultTrailing() {
    return <Widget>[
      InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(Sizes.PADDING_10),
          child: Image.asset(
            ImagePath.NOTIFICATION,
            color: trailingColor,
          ),
        ),
      )
    ];
  }

  // Widget defaultLeading() {
  //   return InkWell(
  //     onTap: () {},
  //     child: Padding(
  //       padding: const EdgeInsets.only(left: Sizes.PADDING_16),
  //       child: SvgPicture.asset(
  //         RoamImagePath.MENU_ICON,
  //         color: leadingColor,
  //       ),
  //     ),
  //   );
  // }
}
