import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/screen/home/bloc/home_bloc.dart';
import 'package:flutter_movie_db/screen/home/widget/home_account_navigator.dart';
import 'package:flutter_movie_db/screen/home/widget/home_movie_navigator.dart';
import 'package:flutter_movie_db/screen/home/widget/home_saved_film_navigator.dart';
import 'package:flutter_movie_db/screen/home/widget/home_setting_navigator.dart';
import 'package:flutter_movie_db/screen/home/widget/home_tv_navigator.dart';

class HomeNavigator extends StatelessWidget {
  const HomeNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.selectedIndex != current.selectedIndex;
      },
      builder: (context, state) {
        return IndexedStack(
          index: state.selectedIndex,
          children: const [
            HomeMovieNavigator(),
            HomeTvNavigator(),
            HomeSavedFilmNavigator(),
            HomeAccountNavigator(),
            HomeSettingNavigator(),
          ],
        );
      },
    );
  }
}
