import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/stacked_images.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'custom_button_2.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({
    this.width,
    this.height,
    this.imagePath,
    this.hasImg=true,
    this.name,
    this.description,
    this.Questions,
    this.borderRadius = const BorderRadius.all(
      const Radius.circular(
        Sizes.RADIUS_8,
      ),
    ),
  });

  final double width;
  final double height;
  final String imagePath;
  final String name;
  final String description;
  final BorderRadiusGeometry borderRadius;
  final int Questions;
  final bool hasImg;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    double widthOfCard = assignWidth(context: context, fraction: 1);
    double heightOfCard = assignHeight(context: context, fraction: 0.225);
    double kPadding = Sizes.PADDING_14;
    return Container(
      width: (width ?? widthOfCard) + 10,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        elevation: 3.0,
        child: Container(
          padding: EdgeInsets.all(kPadding),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: borderRadius,
                  child:hasImg ?
                  Image.asset(
                    imagePath,
                    width: (width ?? widthOfCard * 0.35) - (kPadding * 2),
                    height: height ?? heightOfCard,
                    fit: BoxFit.fill,
                  )
                      :
                  Image.asset(
                    CategoryImage.programming,
                    width: (width ?? widthOfCard * 0.35) - (kPadding * 2),
                    height: height ?? heightOfCard,
                    fit: BoxFit.fill,
                  )
              ),
              SpaceW8(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headline6,
                    ),
                    SpaceH8(),
                    Row(
                      children: [
                        Text(
                          StringConst.NUMPER_OF_QUSTIONS,
                          overflow: TextOverflow.ellipsis,
                          style: theme.textTheme.bodyText2.copyWith(
                            color: AppColors.blackFull,
                            fontSize: Sizes.TEXT_SIZE_14,
                          ),
                        ),
                        SpaceW4(),
                        StackedImages(
                          extraImagesLength: Questions,
                        ),
                      ],
                    ),
                    SpaceH8(),
                    Text(
                      description,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyText2.copyWith(
                        color: AppColors.blackFull,
                        fontSize: Sizes.TEXT_SIZE_16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomButton2(
                          hasText: true,
                          text: StringConst.SHOW,
                          onPressed: () {},
                          borderRadius: Sizes.RADIUS_8,
                          iconColor:AppColors.white,
                          icon: FontAwesomeIcons.eye,
                          iconSize: Sizes.ICON_SIZE_14,
                        ),
                        Spacer(),
                        CustomButton2(
                          hasText: true,
                          text: StringConst.SEND_REQ,
                          onPressed: () {},
                          borderRadius: Sizes.RADIUS_8,
                          iconColor:AppColors.white,
                          icon: FontAwesomeIcons.paperPlane,
                          iconSize: Sizes.ICON_SIZE_12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

