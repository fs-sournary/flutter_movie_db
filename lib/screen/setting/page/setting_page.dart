import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/di/get_it.dart';
import 'package:flutter_movie_db/screen/setting/bloc/setting_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (_) => const SettingPage(),
      );

  static const name = '/setting';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SettingBloc>(),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (getWindowType(context) == AdaptiveWindowType.small) {
            return const _MobileLayout();
          } else {
            return const _LargeLayout();
          }
        },
      ),
    );
  }
}

class _MobileLayout extends StatelessWidget {
  const _MobileLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _LargeLayout extends StatelessWidget {
  const _LargeLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
