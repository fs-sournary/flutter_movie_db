import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/movie/page/movie_page.dart';

class HomeMovieNavigator extends StatelessWidget {
  const HomeMovieNavigator({Key? key}) : super(key: key);

  static const _key = GlobalObjectKey('movie');

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _key,
      initialRoute: MoviePage.name,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MoviePage.name:
            return MoviePage.route();
          default:
            return null;
        }
      },
    );
  }
}
