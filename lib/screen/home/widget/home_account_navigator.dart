import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/account/page/account_page.dart';

class HomeAccountNavigator extends StatelessWidget {
  const HomeAccountNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: const GlobalObjectKey<NavigatorState>('account'),
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
}
