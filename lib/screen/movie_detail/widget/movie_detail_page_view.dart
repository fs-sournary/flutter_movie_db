import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:flutter_movie_db/utils/constants.dart';

class MovieDetailPageView extends StatefulWidget {
  const MovieDetailPageView({Key? key}) : super(key: key);

  @override
  State<MovieDetailPageView> createState() => _MovieDetailPageViewState();
}

class _MovieDetailPageViewState extends State<MovieDetailPageView> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) =>
          previous.movieImages.posters != current.movieImages.posters,
      builder: (context, state) {
        final posters = state.movieImages.posters;
        if (posters.isEmpty) {
          return Container(height: 440);
        }
        return PageView.builder(
          controller: _pageController,
          itemBuilder: (context, index) {
            return _Item(image: posters[index % posters.length].filePath);
          },
          onPageChanged: (page) {},
        );
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}

class _Item extends StatelessWidget {
  const _Item({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 440,
      child: Image.network(
        baseApiImage + image,
        loadingBuilder: (context, child, loadingProgress) {
          return loadingProgress == null
              ? child
              : const Center(child: CircularProgressIndicator());
        },
        fit: BoxFit.cover,
      ),
    );
  }
}
