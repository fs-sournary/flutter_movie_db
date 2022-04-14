import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/setting/page/setting_page.dart';

class HomePageSettingTabNavigator extends StatelessWidget {
  static final observer = RouteObserver();

  final GlobalObjectKey<NavigatorState> navigatorKey;

  const HomePageSettingTabNavigator({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        initialRoute: SettingPage.name,
        observers: [observer],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case SettingPage.name:
              return SettingPage.route();
            default:
              return SettingPage.route();
          }
        },
      );
}
