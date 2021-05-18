import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_button.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';
import 'package:wcif_application/values/values.dart';

class AlertDialog2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => _buildDialog(context),
              );
            },
            child: Text(StringConst.SHOW_ALERT),
          ),
        ),
      ),
    );
  }

  Widget _buildDialog(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Radius borderRadius = const Radius.circular(Sizes.RADIUS_60);
    return Dialog(
      backgroundColor: AppColors.grey2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: borderRadius,
          bottomLeft: borderRadius,
        ),
      ),
      elevation: Sizes.ELEVATION_8,
      child: Container(
        padding: const EdgeInsets.all(Sizes.MARGIN_30),
        height: assignHeight(context: context, fraction: 0.5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              StringConst.ARE_YOU_SURE,
              style: theme.textTheme.headline6.copyWith(
                color: AppColors.white,
              ),
            ),
            SpaceH8(),
            Text(
              StringConst.LOREM_IPSUM,
              style: theme.textTheme.bodyText2.copyWith(
                color: AppColors.black50,
              ),
            ),
            Spacer(),
            CustomButton(
              title: StringConst.YES,
              height: Sizes.HEIGHT_44,
              textStyle: theme.textTheme.subtitle2.copyWith(
                color: AppColors.white,
              ),
              color: AppColors.greenblue2,
              onPressed: () => closeDialog(),
            ),
            SpaceH8(),
            CustomButton(
              title: StringConst.MAYBE,
              height: Sizes.HEIGHT_44,
              color: AppColors.greenligth,
              textStyle: theme.textTheme.subtitle2.copyWith(
                color: AppColors.white,
              ),
              onPressed: () => closeDialog(),
            ),
            SpaceH8(),
            CustomButton(
              title: StringConst.CANCEL,
              height: Sizes.HEIGHT_44,
              color: AppColors.grey,
              textStyle: theme.textTheme.subtitle2.copyWith(
                color: AppColors.white,
              ),
              onPressed: () => closeDialog(),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  void closeDialog() {
    ExtendedNavigator.root.pop();
  }
}
