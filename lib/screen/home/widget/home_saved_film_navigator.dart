import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/saved_film/page/saved_film_page.dart';

class HomeSavedFilmNavigator extends StatelessWidget {
  const HomeSavedFilmNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: const GlobalObjectKey<NavigatorState>('saved_film'),
      initialRoute: SavedFilmPage.name,
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
}
