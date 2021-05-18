import 'package:flutter/material.dart';
import 'package:wcif_application/values/values.dart';
import 'file:///C:/Users/ielsh/AndroidStudioProjects/wcif_application/lib/widgets/layout/empty.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';

class CustomButton2 extends StatelessWidget {
  CustomButton2({
    this.onPressed,
    this.height = Sizes.HEIGHT_46,
    this.elevation = Sizes.ELEVATION_1,
    this.borderRadius = Sizes.RADIUS_24,
    this.color = AppColors.greenblue,
    this.iconColor = AppColors.white,
    this.iconSize,
    this.borderSide = Borders.defaultPrimaryBorder,
    this.icon,
    this.hasText = false,
    this.text,
  });

  final VoidCallback onPressed;
  final double height;
  final double elevation;
  final double borderRadius;
  final Color color;
  final Color iconColor;
  final double iconSize;
  final BorderSide borderSide;
  final IconData icon;
  final bool hasText;
  final String text;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return MaterialButton(
      onPressed: onPressed,
      elevation: elevation,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        side: borderSide,
      ),
      height: height,
      color: color,
      child: Row(
        children:[
          hasText ? Text(text,style: theme.textTheme.bodyText1.copyWith(
            color: AppColors.white,
            fontSize: Sizes.TEXT_SIZE_14,
          ),) : Empty(),
          hasText ?  SpaceW4() : Empty(),
          Icon(
          icon,
          color: iconColor,
          size: iconSize,
        ),
      ]
      ),
    );
  }
}
