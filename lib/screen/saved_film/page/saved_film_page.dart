import 'package:flutter/material.dart';

class SavedFilmPage extends StatelessWidget {
  const SavedFilmPage({Key? key}) : super(key: key);

  static Route route() => MaterialPageRoute(
        builder: (context) => const SavedFilmPage(),
      );

  static const name = '/saved_film';

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Saved film'),
    );
  }
}
