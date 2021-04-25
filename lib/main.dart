import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wcif_application/routes/router.gr.dart';
import 'themes/theme_bloc.dart';
import 'package:provider/provider.dart';
import 'package:wcif_application/controllers/user_controller.dart';
import 'package:wcif_application/public_models/loading.dart';
import 'package:bot_toast/bot_toast.dart';

void main() {
  runApp(start());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class start extends StatefulWidget {
  @override
  _startState createState() => _startState();
}

class _startState extends State<start> {
  ThemeBloc _themeBloc;

  @override
  void initState(){
    super.initState();
    _themeBloc= ThemeBloc();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ThemeData>(
        initialData: _themeBloc.initialTheme().data,
        stream: _themeBloc.themeDataStream,
        builder: (BuildContext context, AsyncSnapshot<ThemeData> snapshot){
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<LoadingModel>.value(
                value: LoadingModel(),
              ),
              ChangeNotifierProvider<UserController>.value(
                value: UserController(),
              ),
            ],
            child: MaterialApp(
              localizationsDelegates: [
                GlobalCupertinoLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              supportedLocales: [
                Locale("ar", "AE"),
              ],
              locale: Locale("ar", "AE"),
              debugShowCheckedModeBanner: false,
              theme: snapshot.data,
              darkTheme: null,
              builder: ExtendedNavigator(
                router: AppRouter(),
                initialRoute: Routes.welcomeScreen,
                observers: [routeObserver],
              ),
             // BotToastInit(),
            ),
          );
        }
    );
  }
}