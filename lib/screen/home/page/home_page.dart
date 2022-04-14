import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/home/view/home_page_account_tab_navigator.dart';
import 'package:flutter_movie_db/screen/home/view/home_page_movie_tab_navigator.dart';
import 'package:flutter_movie_db/screen/home/view/home_page_saved_film_tab_navigator.dart';
import 'package:flutter_movie_db/screen/home/view/home_page_setting_tab_navigator.dart';
import 'package:flutter_movie_db/screen/home/view/home_page_television_tab_navigator.dart';

class HomePage extends StatefulWidget {
  static Route route() => MaterialPageRoute(
        builder: (_) => const HomePage(),
      );

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const _navigatorKeys = [
    GlobalObjectKey<NavigatorState>("movie"),
    GlobalObjectKey<NavigatorState>('television'),
    GlobalObjectKey<NavigatorState>('saved_film'),
    GlobalObjectKey<NavigatorState>('account'),
    GlobalObjectKey<NavigatorState>('setting'),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          final canPop =
              await _navigatorKeys[_selectedIndex].currentState?.maybePop();
          return canPop == false;
        },
        child: Scaffold(
          body: PageTransitionSwitcher(
            transitionBuilder: (child, primaryAnimation, secondaryAnimation) {
              return FadeThroughTransition(
                animation: primaryAnimation,
                secondaryAnimation: secondaryAnimation,
                child: child,
              );
            },
            child:
             IndexedStack(
              index: _selectedIndex,
              children: [
                HomePageMovieTabNavigator(navigatorKey: _navigatorKeys[0]),
                HomePageTelevisionTabNavigator(navigatorKey: _navigatorKeys[1]),
                HomePageSavedFilmTabNavigator(navigatorKey: _navigatorKeys[2]),
                HomePageAccountTabNavigator(navigatorKey: _navigatorKeys[3]),
                HomePageSettingTabNavigator(navigatorKey: _navigatorKeys[4]),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                icon: const Icon(Icons.movie),
                label: S.current.home_movie_tab_label,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.tv),
                label: S.current.home_television_tab_label,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.storage),
                label: S.current.home_saved_film_tab_label,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.account_circle),
                label: S.current.home_account_tab_label,
              ),
              BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: S.current.home_setting_tab_label,
              ),
            ],
            selectedItemColor: Colors.blue,
            onTap: (value) {
              setState(() {
                _selectedIndex = value;
              });
            },
          ),
        ),
      );
}
