import 'package:flutter/material.dart';

class TvPage extends StatelessWidget {
  static const name = "/television";

  static Route route() => MaterialPageRoute(
        builder: (context) => const TvPage(),
      );

  const TvPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Television'),
        backgroundColor: Colors.red,
      ),
      backgroundColor: Colors.blue,
      body: const Center(
        child: Text('Television'),
      ),
    );
  }
}
