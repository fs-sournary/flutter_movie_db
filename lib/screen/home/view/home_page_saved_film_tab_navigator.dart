import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/saved_film/page/saved_film_page.dart';

class HomePageSavedFilmTabNavigator extends StatelessWidget {
  static final observer = RouteObserver();

  final GlobalObjectKey<NavigatorState> navigatorKey;

  const HomePageSavedFilmTabNavigator({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        initialRoute: SavedFilmPage.name,
        observers: [observer],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case SavedFilmPage.name:
              return SavedFilmPage.route();
            default:
              return SavedFilmPage.route();
          }
        },
      );
}
