import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/model/category_movies.dart';
import 'package:flutter_movie_db/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter_movie_db/screen/movie_detail/page/movie_detail_page.dart';
import 'package:flutter_movie_db/utils/constants.dart';
import 'package:flutter_movie_db/widget/rating_bar.dart';

class NowPlayingMovieList extends StatelessWidget {
  const NowPlayingMovieList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => BlocBuilder<MovieBloc, MovieState>(
        buildWhen: (previous, current) =>
            previous.nowPlayingCategoryMovies.results !=
            current.nowPlayingCategoryMovies.results,
        builder: (context, state) {
          final movies = state.nowPlayingCategoryMovies.results;
          return SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              itemBuilder: (context, index) {
                return _Item(
                  onItemClicked: (int movieId) {
                    Navigator.of(context, rootNavigator: true)
                        .pushNamed(MovieDetailPage.name, arguments: movieId);
                  },
                  item: movies[index],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemCount: movies.length,
            ),
          );
        },
      );
}

class _Item extends StatelessWidget {
  final Function(int) onItemClicked;
  final CategoryMovie item;

  const _Item({
    Key? key,
    required this.onItemClicked,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemClicked.call(item.id),
      child: Container(
        width: 160,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 4)
          ],
        ),
        child: Column(
          children: [
            Expanded(child: _buildAvatar()),
            _buildTitle(),
            _buildVoteAverage(),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return SizedBox(
      width: double.infinity,
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
        child: Image.network(baseApiImage + item.posterPath, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildTitle() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
      child: Text(
        item.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildVoteAverage() {
    return Container(
      margin: const EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 8),
      child: Row(
        children: [
          Text(item.voteAverage.toString()),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 4),
              child: RatingBar(rating: item.voteAverage, color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
