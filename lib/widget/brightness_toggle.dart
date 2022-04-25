import 'package:flutter/material.dart';
import 'package:flutter_movie_db/widget/theme_provider.dart';

class BrightnessToggle extends StatelessWidget {
  const BrightnessToggle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkTheme = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      onPressed: () {
        final themeProvider = ThemeProvider.of(context);
        final settings = themeProvider.settings.value;
        final newSettings = ThemeSetting(
          sourceColor: settings.sourceColor,
          themeMode: isDarkTheme ? ThemeMode.light : ThemeMode.dark,
        );
        ThemeSettingChange(setting: newSettings).dispatch(context);
      },
      icon: isDarkTheme
          ? const Icon(Icons.brightness_7)
          : const Icon(Icons.brightness_3),
    );
  }
}
