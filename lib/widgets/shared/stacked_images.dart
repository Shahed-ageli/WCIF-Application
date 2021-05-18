import 'package:flutter/material.dart';
import 'package:wcif_application/values/values.dart';

const double kWidth = Sizes.WIDTH_24;
const double kHeight = Sizes.HEIGHT_24;
const double kOffset = kWidth / 2;

class StackedImages extends StatelessWidget {
  StackedImages({
    this.extraImagesLength,
    this.width,
    this.widthOfImageItem = kWidth,
    this.heightOfImageItem = kHeight,
    this.offset = kOffset,
    this.color = AppColors.greenblue,
    this.textColor = AppColors.white,
    this.textSize,
    this.borderRadius = const BorderRadius.all(
      const Radius.circular(
        Sizes.RADIUS_20,
      ),
    ),
  });

  final BorderRadiusGeometry borderRadius;
  final int extraImagesLength;
  final double width;
  final double widthOfImageItem;
  final double heightOfImageItem;
  final double offset;
  final Color color;
  final Color textColor;
  final double textSize;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: width,
      child: Stack(
          children: [
            Container(
              width: widthOfImageItem,
              height: heightOfImageItem,
              margin: EdgeInsets.only(left: (offset * 1)),
              decoration: BoxDecoration(
                color: color,
                borderRadius: borderRadius,
              ),
              child: Center(
                child: Text(
                  "$extraImagesLength",
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.subtitle1.copyWith(
                    color: textColor,
                    fontSize: (textSize) ??
                        ("$extraImagesLength".length >= 4
                            ? Sizes.TEXT_SIZE_8
                            : Sizes.TEXT_SIZE_10),
                  ),
                ),
              ),
            ),
          ]
      ),
    );
  }
}

