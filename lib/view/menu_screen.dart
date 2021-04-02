import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:wcif_application/themes/app_theme.dart';
import 'package:wcif_application/themes/theme_bloc.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'package:wcif_application/values/values.dart';
import '../../main.dart';
import 'package:wcif_application/widgets/shared/spaces.dart';
import 'package:wcif_application/widgets/layout/adaptive.dart';

class MenuItem {
  MenuItem(this.title, {this.iconData, this.onTap, this.selected = false});

  final String title;
  final IconData iconData;
  final GestureTapCallback onTap;
  bool selected;
}

class MenuScreen extends StatefulWidget {

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen>
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
      selected: false,
      onTap: ()
      {
        ExtendedNavigator.root.push(Routes.profileScreen);
      },
    ),
    MenuItem(
      StringConst.CATEGORIES,
      iconData: FeatherIcons.grid,
      selected: false,
      onTap: ()
      {
        ExtendedNavigator.root.push(Routes.categoriesScreen);
      },
    ),
    MenuItem(
      StringConst.FOLLOWERS,
      iconData: FeatherIcons.users,
      selected: false,
      onTap: () {
        ExtendedNavigator.root.push(Routes.followerScreen);
      },
    ),
    MenuItem(
      StringConst.FOLLOWING,
      iconData: FeatherIcons.users,
      selected: false,
      onTap: () {
        ExtendedNavigator.root.push(Routes.followingScreen);
      },
    ),
    MenuItem(
      StringConst.Settings,
      iconData: FeatherIcons.settings,
      selected: false,
      onTap: () {
        ExtendedNavigator.root.push(Routes.settingScreen);
      },
    ),
    MenuItem(
      StringConst.ABOUT_US,
      iconData: FeatherIcons.info,
      selected: false,
      onTap: () {
        ExtendedNavigator.root.push(Routes.aboutUsScreen);
      },
    ),
    MenuItem(
      StringConst.LOG_OUT,
      iconData: FeatherIcons.logOut,
      selected: false,
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
    ThemeData theme = Theme.of(context);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: AppColors.grey50,
      drawer: ClipRRect(
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(Sizes.PADDING_8,Sizes.PADDING_8,Sizes.PADDING_8,Sizes.PADDING_8),
                  child: Column(
                    children: _buildMenuList(menuList),
                  ),
                ),
              ],
            ),
          ),
        ),
     ),
      body: Stack(
        children: [
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: Sizes.PADDING_24,
                  top: Sizes.PADDING_16,
                ),
                child: Row(
                  children: [
                    InkWell(
                      onTap: () => scaffoldKey.currentState.openDrawer(),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.menu,
                          color: AppColors.primaryColor,
                          size: Sizes.ICON_SIZE_28,
                        ),
                      ),
                    ),
                    SpaceW12(),
                    Text(
                      StringConst.APP_NAME,
                      style: theme.textTheme.headline5.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


  Widget _buildDrawerHeader() {
    ThemeData theme = Theme.of(context);
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(
            Sizes.PADDING_10,
            Sizes.PADDING_10,
            Sizes.PADDING_10,
            Sizes.PADDING_10,
          ),

        ),
        Container(
          padding: const EdgeInsets.fromLTRB(
            Sizes.PADDING_16,
            Sizes.PADDING_16,
            Sizes.PADDING_16,
            Sizes.PADDING_8,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                ImagePath.BOB,
                fit: BoxFit.cover,
              ),
              // SpaceH8(),
              Text(
                StringConst.AHMED,
                style: theme.textTheme.subtitle1.copyWith(
                  color: AppColors.white,
                  fontSize: Sizes.SIZE_20,
                ),
              ),
              Text(
                StringConst.SALOMAN_USERNAME,
                style: theme.textTheme.bodyText2.copyWith(
                  color: AppColors.moov,
                  fontSize: Sizes.SIZE_20,
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
                selectedTileColor: AppColors.primaryColor,
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: Sizes.PADDING_16,
                ),
                leading: Icon(
                  menuItemList[index].iconData,
                  color: menuItemList[index].selected
                      ? AppColors.primaryColor
                      : AppColors.purpleL,
                ),
                title: Text(
                  menuItemList[index].title,
                  style: theme.textTheme.subtitle2.copyWith(
                    fontSize: Sizes.SIZE_16,
                    color: menuItemList[index].selected
                        ? AppColors.primaryColor
                        : AppColors.violet400,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 4),
                  borderRadius: BorderRadius.all(
                    const Radius.circular(Sizes.RADIUS_80),
                  ),
                ),
                onTap: menuItemList[index].onTap,
              ),
            ),
          ),
      );
    }
    return menuList;
  }
}
