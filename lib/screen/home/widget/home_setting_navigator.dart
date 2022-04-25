import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/setting/page/setting_page.dart';

class HomeSettingNavigator extends StatelessWidget {
  const HomeSettingNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: const GlobalObjectKey<NavigatorState>('setting'),
      initialRoute: SettingPage.name,
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
}
