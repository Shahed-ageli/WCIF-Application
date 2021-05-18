import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'file:///C:/Users/ielsh/AndroidStudioProjects/wcif_application/lib/widgets/layout/auto_load.dart';
import 'package:wcif_application/widgets/shared/custom_appbar.dart';
import 'package:wcif_application/widgets/shared/main_menu.dart';
import 'package:wcif_application/widgets/shared/search_input.dart';
import 'package:flutter/material.dart';
import 'package:wcif_application/widgets/shared/custom_list_tile.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/values/values.dart';

class FollowingScreen extends StatefulWidget {
  @override
  _FollowingScreenState createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    var follow = Provider.of<UserController>(context, listen: true);

    return AutoLoad(
      onInit: () async {
        await follow.getFollowings();
        await follow.getFollowers();
      },
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(Sizes.HEIGHT_56),
            child: CustomAppBar(
              hasTitle: true,
              title: "المتابعات",
            ),
          ),
          drawer: MainMenu(),
          body: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: kSidePadding,
              vertical: Sizes.PADDING_8,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SpaceH20(),
                Text(
                  StringConst.SEARCH_USER,
                  style: theme.textTheme.bodyText1.copyWith(
                    color: AppColors.greenblue,
                    fontSize: Sizes.TEXT_SIZE_20,
                  ),
                ),
                SpaceH20(),
                SearchInput(),
                SpaceH20(),
                TabBar(
                  labelColor: AppColors.greenblue2,
                  labelStyle: theme.textTheme.subtitle1.copyWith(
                    color: AppColors.greenblue2,
                    fontSize: Sizes.TEXT_SIZE_14,
                  ),
                  labelPadding: EdgeInsets.zero,
                  unselectedLabelColor: AppColors.black60,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      text: StringConst.FOLLOWING,
                    ),
                    Tab(
                      text: StringConst.FOLLOWERS,
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(

                    children: [
                      follow.Followings == 0 ?
                      Column(
                          children: [
                            Text(
                              StringConst.INLOAD,
                              style: theme.textTheme.bodyText1.copyWith(
                                color: AppColors.blackFull,
                                fontSize:Sizes.SIZE_20,
                              ),
                            ),
                            Image.asset(
                                ImagePath.LOAD
                            ),
                          ])
                          : follow.Followings == 1 && follow.followingsList.length!=0?
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: follow.followingsList.length,
                        itemBuilder: (context, index) {
                          return  _buildFollowingsList(context, index, follow);
                        },
                      )
                          : follow.followingsList.length==0 ?
                      Column(
                        children: [
                          SpaceH20(),
                          Center(
                            child: Text(
                              StringConst.FOLLOWINGS_NULL,
                              style: theme.textTheme.headline5.copyWith(
                                color: AppColors.bluegreen,
                                fontSize: Sizes.TEXT_SIZE_28,
                              ),
                            ),
                          ),
                        ],
                      )
                          : follow.Followings == 2 ?
                      Container(
                        child: Text(
                          StringConst.PROBLEM_IN_LOAD,
                          style: theme.textTheme.bodyText1.copyWith(
                            color: AppColors.blackFull,
                            fontSize:Sizes.SIZE_20,
                          ),
                        ),
                      ) : Container(),
                      ////////////////////////////////////////////////
                      follow.Followers == 0 ?
                      Column(
                          children: [
                            Text(
                              StringConst.INLOAD,
                              style: theme.textTheme.bodyText1.copyWith(
                                color: AppColors.blackFull,
                                fontSize:Sizes.SIZE_20,
                              ),
                            ),
                            Image.asset(
                                ImagePath.LOAD
                            ),
                          ])
                          : follow.Followers == 1 && follow.followersList.length !=0 ?
                      ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: follow.followersList.length,
                        itemBuilder: (context, index) {
                          return  _buildFollowersList(context, index, follow);
                        },
                      )
                          : follow.followersList.length == 0 ?
                      Column(
                        children: [
                          SpaceH20(),
                          Center(
                            child: Text(
                              StringConst.FOLLOWERS_NULL,
                              style: theme.textTheme.headline5.copyWith(
                                color: AppColors.bluegreen,
                                fontSize: Sizes.TEXT_SIZE_28,
                              ),
                            ),
                          ),
                        ],
                      )
                          : follow.Followers == 2 ?
                      Container(
                        child: Text(
                          StringConst.PROBLEM_IN_LOAD,
                          style: theme.textTheme.bodyText1.copyWith(
                            color: AppColors.blackFull,
                            fontSize:Sizes.SIZE_20,
                          ),
                        ),
                      ) : Container(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFollowingsList(BuildContext context,int index, UserController follow) {
    return CustomListTile(
      imagePath: ImagePath.MEN,
      name: follow.followingsList[index].loginName,
      email: follow.followingsList[index].email,
      isFollowing:true,
      userId:follow.followingsList[index].UserId.toString(),
      follow:follow,
    );
  }

  Widget _buildFollowersList(BuildContext context,int index, UserController follow) {
    return CustomListTile(
      name: follow.followersList[index].loginName,
      imagePath: ImagePath.MEN,
      isFollowing: (follow.followingsList.singleWhere((element) => element.UserId==follow.followersList[index].UserId,orElse: () => null)) != null ? true: false,
      email: follow.followersList[index].email,
      userId:follow.followersList[index].UserId.toString(),
      follow:follow,
    );
  }
}