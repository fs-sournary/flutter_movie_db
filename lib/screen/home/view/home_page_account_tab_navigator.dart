import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/account/page/account_page.dart';

class HomePageAccountTabNavigator extends StatelessWidget {
  final GlobalObjectKey<NavigatorState> navigatorKey;

  const HomePageAccountTabNavigator({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case AccountPage.name:
              return AccountPage.route();
            default:
              return AccountPage.route();
          }
        },
      );
}
