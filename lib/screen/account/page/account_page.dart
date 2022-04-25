import 'package:flutter/material.dart';
import 'package:flutter_movie_db/screen/movie_detail/page/movie_detail_page.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (context) => const AccountPage(),
      );

  static const name = '/account';

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
