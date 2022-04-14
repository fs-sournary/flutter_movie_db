import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/movie_detail/page/movie_detail_page.dart';

class SettingPage extends StatelessWidget {
  static const name = '/setting';

  static Route route() => MaterialPageRoute(
        builder: (_) => const SettingPage(),
      );

  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
          onTap: () => Navigator.of(context).pushNamed(MovieDetailPage.name),
          child: const Text('Setting')),
    );
  }
}
