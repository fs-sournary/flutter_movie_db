// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `hr`
  String get short_hour {
    return Intl.message(
      'hr',
      name: 'short_hour',
      desc: '',
      args: [],
    );
  }

  /// `min`
  String get short_minute {
    return Intl.message(
      'min',
      name: 'short_minute',
      desc: '',
      args: [],
    );
  }

  /// `•`
  String get dot_separator {
    return Intl.message(
      '•',
      name: 'dot_separator',
      desc: '',
      args: [],
    );
  }

  /// `done loading`
  String get network_image_loading_prefix {
    return Intl.message(
      'done loading',
      name: 'network_image_loading_prefix',
      desc: '',
      args: [],
    );
  }

  /// `Loaded`
  String get network_image_loaded_url {
    return Intl.message(
      'Loaded',
      name: 'network_image_loaded_url',
      desc: '',
      args: [],
    );
  }

  /// `No image`
  String get network_image_error {
    return Intl.message(
      'No image',
      name: 'network_image_error',
      desc: '',
      args: [],
    );
  }

  /// `Movie`
  String get home_title {
    return Intl.message(
      'Movie',
      name: 'home_title',
      desc: '',
      args: [],
    );
  }

  /// `Movie`
  String get home_movie_tab_label {
    return Intl.message(
      'Movie',
      name: 'home_movie_tab_label',
      desc: '',
      args: [],
    );
  }

  /// `Television`
  String get home_television_tab_label {
    return Intl.message(
      'Television',
      name: 'home_television_tab_label',
      desc: '',
      args: [],
    );
  }

  /// `Saved film`
  String get home_saved_film_tab_label {
    return Intl.message(
      'Saved film',
      name: 'home_saved_film_tab_label',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get home_account_tab_label {
    return Intl.message(
      'Account',
      name: 'home_account_tab_label',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get home_setting_tab_label {
    return Intl.message(
      'Setting',
      name: 'home_setting_tab_label',
      desc: '',
      args: [],
    );
  }

  /// `Latest`
  String get home_latest_title {
    return Intl.message(
      'Latest',
      name: 'home_latest_title',
      desc: '',
      args: [],
    );
  }

  /// `Now playing`
  String get home_now_playing_title {
    return Intl.message(
      'Now playing',
      name: 'home_now_playing_title',
      desc: '',
      args: [],
    );
  }

  /// `Popular`
  String get home_popular_title {
    return Intl.message(
      'Popular',
      name: 'home_popular_title',
      desc: '',
      args: [],
    );
  }

  /// `Top rated`
  String get home_top_rated_title {
    return Intl.message(
      'Top rated',
      name: 'home_top_rated_title',
      desc: '',
      args: [],
    );
  }

  /// `Upcoming`
  String get home_upcoming_title {
    return Intl.message(
      'Upcoming',
      name: 'home_upcoming_title',
      desc: '',
      args: [],
    );
  }

  /// `View all`
  String get home_view_all_action {
    return Intl.message(
      'View all',
      name: 'home_view_all_action',
      desc: '',
      args: [],
    );
  }

  /// `Search...`
  String get home_search_hint {
    return Intl.message(
      'Search...',
      name: 'home_search_hint',
      desc: '',
      args: [],
    );
  }

  /// `Genre`
  String get movie_detail_genre_title {
    return Intl.message(
      'Genre',
      name: 'movie_detail_genre_title',
      desc: '',
      args: [],
    );
  }

  /// `Also view more information. `
  String get movie_detail_home_learn_more_message {
    return Intl.message(
      'Also view more information. ',
      name: 'movie_detail_home_learn_more_message',
      desc: '',
      args: [],
    );
  }

  /// `Learn more.`
  String get movie_detail_home_learn_more_action {
    return Intl.message(
      'Learn more.',
      name: 'movie_detail_home_learn_more_action',
      desc: '',
      args: [],
    );
  }

  /// `The homepage is unavailable`
  String get movie_detail_unavailable_url_message {
    return Intl.message(
      'The homepage is unavailable',
      name: 'movie_detail_unavailable_url_message',
      desc: '',
      args: [],
    );
  }

  /// `Overview`
  String get movie_detail_overview_title {
    return Intl.message(
      'Overview',
      name: 'movie_detail_overview_title',
      desc: '',
      args: [],
    );
  }

  /// `View more`
  String get movie_detail_view_more {
    return Intl.message(
      'View more',
      name: 'movie_detail_view_more',
      desc: '',
      args: [],
    );
  }

  /// `Less`
  String get movie_detail_less {
    return Intl.message(
      'Less',
      name: 'movie_detail_less',
      desc: '',
      args: [],
    );
  }

  /// `Similar movies`
  String get movie_detail_similar_list_title {
    return Intl.message(
      'Similar movies',
      name: 'movie_detail_similar_list_title',
      desc: '',
      args: [],
    );
  }

  /// `More information`
  String get movie_detail_more_information_title {
    return Intl.message(
      'More information',
      name: 'movie_detail_more_information_title',
      desc: '',
      args: [],
    );
  }

  /// `Subtitles`
  String get movie_detail_subtitles {
    return Intl.message(
      'Subtitles',
      name: 'movie_detail_subtitles',
      desc: '',
      args: [],
    );
  }

  /// `Casts`
  String get movie_detail_casts_title {
    return Intl.message(
      'Casts',
      name: 'movie_detail_casts_title',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
