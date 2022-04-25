import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_movie_db/extension/context_extension.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/screen/home/bloc/home_bloc.dart';
import 'package:flutter_movie_db/screen/home/widget/home_extended_drawer.dart';
import 'package:flutter_movie_db/screen/home/widget/home_navigator.dart';
import 'package:flutter_movie_db/screen/home/widget/home_rail_drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const HomePage(),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>(),
      child: context.isMobile ? const _MobileLayout() : const _LargeLayout(),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.selectedIndex != current.selectedIndex,
      builder: (context, state) {
        final index = state.selectedIndex;
        return Scaffold(
          body: const HomeNavigator(),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: index,
            items: List.generate(
              _destinations.length,
              (index) {
                final destination = _destinations[index];
                return BottomNavigationBarItem(
                  icon: destination.icon,
                  label: destination.label,
                );
              },
            ),
            onTap: (value) {
              context.read<HomeBloc>().add(HomeIndexChanged(value));
            },
          ),
        );
      },
    );
  }
}

class _LargeLayout extends StatelessWidget {
  const _LargeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) {
        return previous.selectedIndex != current.selectedIndex;
      },
      builder: (context, state) {
        final drawer = context.isTablet
            ? HomeRailDrawer(destinations: _destinations)
            : HomeExtendedDrawer(destinations: _destinations);
        return Scaffold(
          body: Row(
            children: [
              drawer,
              const Expanded(child: HomeNavigator()),
            ],
          ),
        );
      },
    );
  }
}

final _destinations = [
  Destination(
    icon: const Icon(Icons.movie_creation_outlined),
    label: S.current.home_movie_tab_label,
  ),
  Destination(
    icon: const Icon(Icons.tv),
    label: S.current.home_television_tab_label,
  ),
  Destination(
    icon: const Icon(Icons.storage_rounded),
    label: S.current.home_saved_film_tab_label,
  ),
  Destination(
    icon: const Icon(Icons.account_circle),
    label: S.current.home_account_tab_label,
  ),
  Destination(
    icon: const Icon(Icons.settings),
    label: S.current.home_setting_tab_label,
  ),
];

class Destination {
  final Widget icon;
  final Widget? selectedIcon;
  final String label;
  final Widget? trailing;

  const Destination({
    required this.icon,
    this.selectedIcon,
    required this.label,
    this.trailing,
  });
}
