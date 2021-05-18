import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/themes/app_theme.dart';
import 'package:wcif_application/themes/theme_bloc.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/values/values.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import '../../../main.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';

class MenuItem {
  MenuItem(this.title, {this.iconData, this.onTap, this.selected = false});
  final String title;
  final IconData iconData;
  final GestureTapCallback onTap;
  bool selected =false;
}

class MainMenu extends StatefulWidget {

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu>
    with SingleTickerProviderStateMixin, RouteAware {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  AnimationController _animationController;
  ThemeBloc themeBloc;
  List<MenuItem> menuList = [
    MenuItem(
      StringConst.HOME,
      iconData: FeatherIcons.home,
      selected: true,
      onTap: ()
      {
        ExtendedNavigator.root.push(Routes.homeScreen);
        },
    ),
    MenuItem(
      StringConst.PROFILE,
      iconData: FeatherIcons.user,
      onTap: ()
      {
        ExtendedNavigator.root.push(Routes.profileScreen);
      },
    ),
    MenuItem(
      StringConst.CATEGORIES,
      iconData: FeatherIcons.grid,
      onTap: ()
      {
        ExtendedNavigator.root.push(Routes.categoriesScreen);
      },
    ),
    MenuItem(
      StringConst.THE_FOLLOW,
      iconData: FeatherIcons.users,
      onTap: () {
        ExtendedNavigator.root.push(Routes.followingScreen);
      },
    ),
    MenuItem(
      StringConst.SETTING,
      iconData: FeatherIcons.settings,
      onTap: () {
        ExtendedNavigator.root.push(Routes.settingScreen);
      },
    ),
    MenuItem(
      StringConst.ABOUT_US,
      iconData: FeatherIcons.info,
      onTap: () {
        ExtendedNavigator.root.push(Routes.aboutUsScreen);
      },
    ),
    MenuItem(
      StringConst.LOG_OUT,
      iconData: FeatherIcons.logOut,
      onTap: () {
        ExtendedNavigator.root.push(Routes.loginScreen);
      },
    ),
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      value: 1.0,
      duration: const Duration(milliseconds: 800),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void didPopNext() {
    themeBloc.selectedTheme.add(CurrentTheme('light', AppTheme.lightThemeData));
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: const Radius.circular(Sizes.RADIUS_60),
          bottomRight: const Radius.circular(Sizes.RADIUS_60),
        ),
        child: Drawer(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(Sizes.RADIUS_60),
                  ),
                  child: DrawerHeader(
                    margin: const EdgeInsets.all(Sizes.MARGIN_0),
                    padding: const EdgeInsets.only(
                      left: Sizes.PADDING_24,
                      top: Sizes.PADDING_8,
                    ),
                    child: Container(
                      height: assignHeight(context: context, fraction: 0.3),
                      child:_buildDrawerHeader(),
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.greenblue,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(Sizes.PADDING_8),
                  child: Column(
                    children: _buildMenuList(menuList),
                  ),
                ),
              ],
            ),
          ),
        ),
     );
  }

  Widget _buildDrawerHeader() {
    ThemeData theme = Theme.of(context);
    var user = Provider.of<UserController>(context, listen: true);
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(Sizes.PADDING_10,),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(Sizes.PADDING_16,Sizes.PADDING_16,Sizes.PADDING_16, Sizes.PADDING_8,),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(ImagePath.MEN),
                minRadius: Sizes.RADIUS_30,
                maxRadius: Sizes.RADIUS_30,
              ),
              SpaceH2(),
              Text(
                user.user.loginName,
                style: theme.textTheme.subtitle1.copyWith(
                  color: AppColors.white,
                  fontSize: Sizes.SIZE_24,
                ),
              ),
              Text(
                user.user.email,
                style: theme.textTheme.bodyText2.copyWith(
                  color: AppColors.grey2,
                  fontSize: Sizes.SIZE_20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  List<Widget> _buildMenuList(List<MenuItem> menuItemList) {
    ThemeData theme = Theme.of(context);
    List<Widget> menuList = [];
    for (int index = 0; index < menuItemList.length; index++) {
      menuList.add(
        ClipRRect(
            borderRadius: BorderRadius.all(
              const Radius.circular(Sizes.RADIUS_60),
            ),
            child: Container(
              width: assignWidth(context: context, fraction: 0.60),
              child: ListTile(
                selected: menuItemList[index].selected,
                selectedTileColor: AppColors.greenblue,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.PADDING_16,
                ),
                leading: Icon(
                  menuItemList[index].iconData,
                  color: menuItemList[index].selected
                      ? AppColors.greyPurple
                      : AppColors.greyPurple,
                ),
                title: Text(
                  menuItemList[index].title,
                  style: theme.textTheme.subtitle2.copyWith(
                    fontSize: Sizes.SIZE_20,
                    fontWeight: FontWeight.bold,
                    color: menuItemList[index].selected
                        ? AppColors.greenblue
                        : AppColors.greenblue,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 4),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(Sizes.RADIUS_80),
                  ),
                ),
                onTap:  menuItemList[index].onTap,
              ),
            ),
          ),
      );
    }
    return menuList;
  }

  toggel(List<MenuItem> menuItemList, int index){
    for(int index=0; index<menuItemList.length;index++ ){
      setState(() {
        menuItemList[index].selected=!menuItemList[index].selected;
      });
    }
    menuItemList[index].onTap;
  }
}
