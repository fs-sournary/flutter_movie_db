import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/tv/tv_page.dart';

class HomeTvNavigator extends StatelessWidget {
  const HomeTvNavigator({Key? key}) : super(key: key);

  static const _key = GlobalObjectKey('tv');

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: _key,
      initialRoute: TvPage.name,
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case TvPage.name:
            return TvPage.route();
          default:
            return null;
        }
      },
    );
  }
}
