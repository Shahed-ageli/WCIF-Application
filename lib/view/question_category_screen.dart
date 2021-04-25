import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/custom_button_1.dart';
import 'package:wcif_application/widgets/shared/pill.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/shared/auto_load.dart';

class QuestionCategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);

    return  AutoLoad(
      onInit: () async {
        // BotToast.showLoading();
        await user.loadCategory();
        // BotToast.closeAllLoading();
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
          child: CustomAppBar(
            hasTrailing: false,
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: Sizes.PADDING_24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                StringConst.WHAT_CATEGORY,
                style: theme.textTheme.headline4,
              ),
              SpaceH16(),
              Text(
                StringConst.CHOOSE_CATEGORY,
                style: theme.textTheme.headline6,
              ),
              SpaceH16(),
              Wrap(
                spacing: Sizes.SIZE_16,
                runSpacing: Sizes.SIZE_16,
                children: [
                  user.CategortState == 0
                      ? Container()
                      : user.CategortState == 1
                      ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: user.categoryList.length,
                    itemBuilder: (context, index) {
                      return _buildInterestPills(context,index,user);
                    },
                  )
                      : user.CategortState == 2
                      ? Container(
                    child: Text("حدث خطأ ما"),
                  )
                      : Container(),
                ]
                //_buildInterestPills(DropData.pillItems),
              ),
              Spacer(flex: 2),
              CustomButton(
                onPressed: () {
                  ExtendedNavigator.root.push(Routes.addEditQuestionScreen);
                },
                height: Sizes.HEIGHT_60,
                borderRadiusGeometry: AppRadius.defaultButtonRadius,
                title: StringConst.DONE,
                color: AppColors.primaryColor,
                textStyle: theme.textTheme.subtitle1.copyWith(
                  color: AppColors.white,
                ),
              ),
              SpaceH16(),
              CustomButton(
                onPressed: () {
                  ExtendedNavigator.root.pop();
                },
                height: Sizes.HEIGHT_60,
                borderSide: Borders.defaultButtonBorder,
                borderRadiusGeometry: AppRadius.defaultButtonRadius,
                title: StringConst.SKIP,
                color: AppColors.white,
                textStyle: theme.textTheme.subtitle1.copyWith(
                  color: AppColors.secondaryColor2,
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildInterestPills(BuildContext  context,int index,UserController user){
    return Column(
        children:[
          Pill(
            title: user.categoryList[index].categoryName,
            selectedBackgroundColor:AppColors.pink50,
          ),
          SpaceH16(),
        ]
    );
  }
}
