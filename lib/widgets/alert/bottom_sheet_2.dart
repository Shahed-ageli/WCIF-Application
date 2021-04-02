import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:wcif_application/widgets/shared/container_handle.dart';
import 'package:wcif_application/widgets/shared/custom_button.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';

class BottomSheet2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Radius borderRadius = const Radius.circular(Sizes.RADIUS_60);
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              showModalBottomSheet<void>(
                context: context,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: borderRadius,
                  ),
                ),
                builder: (_) => _buildBottomSheet(context),
              );
            },
            child: Text(StringConst.SHOW_BOTTOM_SHEET),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.only(
        top: Sizes.PADDING_12,
        left: Sizes.PADDING_24,
        right: Sizes.PADDING_24,
        bottom: Sizes.PADDING_16,
      ),
      height: assignHeight(context: context, fraction: 0.5),
      child: Column(
        children: [
          ContainerHandle(),
          Spacer(),
          Text(
            StringConst.GUEST_INFO,
            style: theme.textTheme.headline6,
          ),
          SpaceH16(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(ImagePath.AVA),
                radius: 32,
              ),
              SpaceW16(),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      StringConst.YOGA_TIME,
                      style: theme.textTheme.bodyText2.copyWith(
                        color: AppColors.purpleL,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      StringConst.YOGA_TITLE,
                      style: theme.textTheme.bodyText1.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Spacer(),
          CustomButton(
            title: StringConst.TELL_FRIENDS,
            color: AppColors.purpleL,
            hasIcon: true,
            icon: Icon(FeatherIcons.share2, color: AppColors.white),
            textStyle: theme.textTheme.subtitle2.copyWith(
              color: AppColors.white,
            ),
            onPressed: () => closeDialog(),
          ),
          SpaceH16(),
          CustomButton(
            title: StringConst.DONE,
            color: AppColors.primaryColor,
            textStyle: theme.textTheme.subtitle2.copyWith(
              color: AppColors.white,
            ),
            onPressed: () => closeDialog(),
          ),
          Spacer(),
        ],
      ),
    );
  }

  void closeDialog() {
    ExtendedNavigator.root.pop();
  }
}
