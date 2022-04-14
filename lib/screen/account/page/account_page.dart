import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/movie_detail/page/movie_detail_page.dart';

class AccountPage extends StatelessWidget {
  static const name = '/account';

  static Route route() => MaterialPageRoute(
        builder: (context) => const AccountPage(),
      );

  const AccountPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(MovieDetailPage.name),
        child: const Text('Account'),
      ),
    );
  }
}
