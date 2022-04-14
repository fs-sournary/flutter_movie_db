import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie_db/common/app_theme.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/home/page/home_page.dart';
import 'package:flutter_movie_db/screen/movie_detail/page/movie_detail_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Movie',
      theme: createLightThemeData(context),
      darkTheme: createDarkThemeData(context),
      supportedLocales: S.delegate.supportedLocales,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case MovieDetailPage.name:
            return MovieDetailPage.route(settings.arguments as int);
          default:
            return HomePage.route();
        }
      },
    );
  }
}
