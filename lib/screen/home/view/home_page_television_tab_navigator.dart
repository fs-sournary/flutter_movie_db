import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/television/television_page.dart';

class HomePageTelevisionTabNavigator extends StatelessWidget {
  static final observer = RouteObserver();

  final GlobalObjectKey<NavigatorState> navigatorKey;

  const HomePageTelevisionTabNavigator({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        initialRoute: TelevisionPage.name,
        observers: [observer],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case TelevisionPage.name:
              return TelevisionPage.route();
            default:
              return TelevisionPage.route();
          }
        },
      );
}
