import 'dart:ui';

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/home/page/home_page.dart';
import 'package:flutter_movie_db/screen/movie_detail/page/movie_detail_page.dart';
import 'package:flutter_movie_db/widget/theme_provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final settings = ValueNotifier(const ThemeSetting(
    sourceColor: Color(0xFF6750a4),
    themeMode: ThemeMode.system,
  ));

  @override
  Widget build(BuildContext context) {
    return DynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return ThemeProvider(
          settings: settings,
          lightDynamic: lightDynamic,
          darkDynamic: darkDynamic,
          child: NotificationListener<ThemeSettingChange>(
            onNotification: (notification) {
              settings.value = notification.setting;
              return true;
            },
            child: ValueListenableBuilder(
              valueListenable: settings,
              builder: (context, value, _) {
                final themeProvider = ThemeProvider.of(context);
                return MaterialApp(
                  scrollBehavior: const MaterialScrollBehavior().copyWith(
                    dragDevices: {
                      PointerDeviceKind.mouse,
                      PointerDeviceKind.touch,
                      PointerDeviceKind.stylus,
                      PointerDeviceKind.unknown
                    },
                    scrollbars: false,
                  ),
                  debugShowCheckedModeBanner: false,
                  title: 'Movie',
                  theme: themeProvider.light(settings.value.sourceColor),
                  darkTheme: themeProvider.dark(settings.value.sourceColor),
                  themeMode: themeProvider.settings.value.themeMode,
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
              },
            ),
          ),
        );
      },
    );
  }
}
