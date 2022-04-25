import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter_movie_db/widget/custom_network_image.dart';
import 'package:flutter_movie_db/widget/loading.dart';

class MovieSelectedDetail extends StatelessWidget {
  const MovieSelectedDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) {
        return previous.selectedMovie != current.selectedMovie;
      },
      builder: (context, state) {
        switch (state.movieSelectedStatus) {
          case MovieSelectedStatus.loading:
            return const Loading();
          case MovieSelectedStatus.success:
            final movie = state.selectedMovie;
            final image = movie.posterPath.isNotEmpty
                ? movie.posterPath
                : movie.backdropPath;
            return Container(
              margin: const EdgeInsets.only(top: 16),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomNetworkImage(
                      path: image,
                      height: 300,
                      width: double.infinity,
                    )
                  ],
                ),
              ),
            );
          default:
            return Container();
        }
      },
    );
  }
}
