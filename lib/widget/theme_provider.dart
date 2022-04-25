import 'package:flutter/material.dart';
import 'package:material_color_utilities/blend/blend.dart';

class ThemeProvider extends InheritedWidget {
  const ThemeProvider({
    Key? key,
    required this.settings,
    required this.lightDynamic,
    required this.darkDynamic,
    required Widget child,
  }) : super(key: key, child: child);

  final ValueNotifier<ThemeSetting> settings;
  final ColorScheme? lightDynamic;
  final ColorScheme? darkDynamic;

  ShapeBorder get smallShape => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      );

  ShapeBorder get mediumShape => const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      );

  @override
  bool updateShouldNotify(covariant ThemeProvider oldWidget) {
    return settings != oldWidget.settings;
  }

  ThemeData light([Color? targetColor]) {
    final colorScheme = _colorScheme(Brightness.light, targetColor);
    return ThemeData.light().copyWith(
      colorScheme: colorScheme,
      appBarTheme: _appBarTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
      listTileTheme: _listTileTheme(colorScheme),
      bottomAppBarTheme: _bottomAppBarTheme(colorScheme),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colorScheme),
      navigationRailTheme: _navigationRailTheme(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme),
      drawerTheme: _drawerTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.surfaceVariant,
      useMaterial3: true,
    );
  }

  ThemeData dark([Color? targetColor]) {
    final colorScheme = _colorScheme(Brightness.dark, targetColor);
    return ThemeData.dark().copyWith(
      colorScheme: colorScheme,
      appBarTheme: _appBarTheme(colorScheme),
      cardTheme: _cardTheme(colorScheme),
      listTileTheme: _listTileTheme(colorScheme),
      bottomAppBarTheme: _bottomAppBarTheme(colorScheme),
      bottomNavigationBarTheme: _bottomNavigationBarTheme(colorScheme),
      navigationRailTheme: _navigationRailTheme(colorScheme),
      tabBarTheme: _tabBarTheme(colorScheme),
      drawerTheme: _drawerTheme(colorScheme),
      scaffoldBackgroundColor: colorScheme.surfaceVariant,
      useMaterial3: true,
    );
  }

  AppBarTheme _appBarTheme(ColorScheme colorScheme) {
    return AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: Colors.transparent,
      foregroundColor: colorScheme.onSurface,
    );
  }

  CardTheme _cardTheme(ColorScheme colorScheme) {
    return CardTheme(
      elevation: 2,
      shape: smallShape,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
    );
  }

  ListTileThemeData _listTileTheme(ColorScheme colorScheme) {
    return ListTileThemeData(
      selectedColor: colorScheme.onSecondaryContainer,
      minLeadingWidth: 0,
      textColor: colorScheme.onSurfaceVariant,
    );
  }

  BottomAppBarTheme _bottomAppBarTheme(ColorScheme colorScheme) {
    return BottomAppBarTheme(color: colorScheme.surface, elevation: 0);
  }

  BottomNavigationBarThemeData _bottomNavigationBarTheme(
      ColorScheme colorScheme) {
    return BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: colorScheme.surfaceVariant,
      selectedItemColor: colorScheme.onSurface,
      unselectedItemColor: colorScheme.onSurfaceVariant,
      elevation: 0,
      landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
    );
  }

  NavigationRailThemeData _navigationRailTheme(ColorScheme colorScheme) {
    return NavigationRailThemeData(
      backgroundColor: colorScheme.surfaceVariant,
      useIndicator: true,
    );
  }

  TabBarTheme _tabBarTheme(ColorScheme colorScheme) {
    return TabBarTheme(
      labelColor: colorScheme.secondary,
      unselectedLabelColor: colorScheme.onSurfaceVariant,
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.secondary, width: 2),
        ),
      ),
    );
  }

  DrawerThemeData _drawerTheme(ColorScheme colorScheme) {
    return DrawerThemeData(backgroundColor: colorScheme.surfaceVariant);
  }

  ColorScheme _colorScheme(Brightness brightness, Color? targetColor) {
    Color sourceColor = settings.value.sourceColor;
    if (targetColor != null) {
      sourceColor = _harmonizeColor(targetColor);
    }
    return ColorScheme.fromSeed(seedColor: sourceColor, brightness: brightness);
  }

  /// Harmonize a [CustomColor] using [_harmonizeColor] function.
  Color harmonizeCustomColor(CustomColor customColor) {
    if (customColor.isHarmonized) {
      return _harmonizeColor(customColor.color);
    } else {
      return customColor.color;
    }
  }

  /// Create a [Color] that is result of harmonizing [targetColor]. The result
  /// color is a warner/cooler variant of [targetColor].
  ///
  /// See the [Harmonization] section in
  /// https://m3.material.io/styles/color/the-color-system/custom-colors
  Color _harmonizeColor(Color targetColor) {
    final value =
        Blend.harmonize(targetColor.value, settings.value.sourceColor.value);
    return Color(value);
  }

  static ThemeProvider of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ThemeProvider>()!;
  }
}

class ThemeSetting {
  final Color sourceColor;
  final ThemeMode themeMode;

  const ThemeSetting({required this.sourceColor, required this.themeMode});
}

class ThemeSettingChange extends Notification {
  final ThemeSetting setting;

  const ThemeSettingChange({required this.setting});
}

class CustomColor {
  final String name;
  final Color color;
  final bool isHarmonized;

  const CustomColor({
    required this.name,
    required this.color,
    this.isHarmonized = true,
  });
}
