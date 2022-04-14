import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/movie/page/movie_page.dart';

class HomePageMovieTabNavigator extends StatelessWidget {
  static final observer = RouteObserver();

  final GlobalObjectKey<NavigatorState> navigatorKey;

  const HomePageMovieTabNavigator({
    Key? key,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Navigator(
        key: navigatorKey,
        initialRoute: MoviePage.name,
        observers: [observer],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case MoviePage.name:
              return MoviePage.route();
            default:
              return MoviePage.route();
          }
        },
      );
}
