import 'package:flutter/material.dart';

class SavedFilmPage extends StatelessWidget {
  static const name = '/saved_film';

  static Route route() => MaterialPageRoute(
        builder: (context) => const SavedFilmPage(),
      );

  const SavedFilmPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Saved film'),
    );
  }
}
