import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/model/category_movies.dart';
import 'package:flutter_movie_db/screen/movie/bloc/movie_bloc.dart';
import 'package:flutter_movie_db/screen/movie_detail/page/movie_detail_page.dart';
import 'package:flutter_movie_db/widget/custom_network_image.dart';
import 'package:flutter_movie_db/widget/rating_bar.dart';

class MovieTopRatedList extends StatelessWidget {
  const MovieTopRatedList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBloc, MovieState>(
      buildWhen: (previous, current) {
        return previous.topRatedMovies != current.topRatedMovies;
      },
      builder: (context, state) {
        final movies = state.topRatedMovies;
        return SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            itemBuilder: (context, index) => _Item(
              onItemClicked: (movieId) {
                Navigator.of(context, rootNavigator: true)
                    .pushNamed(MovieDetailPage.name, arguments: movieId);
              },
              item: movies[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: movies.length,
          ),
        );
      },
    );
  }
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
      child: SizedBox(
        width: 160,
        child: Card(
          child: Column(
            children: [
              Expanded(child: _buildAvatar()),
              _buildTitle(context),
              _buildVoteAverage(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    return SizedBox(
      width: double.infinity,
      child: CustomNetworkImage(path: item.posterPath),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
      child: Text(item.title, maxLines: 1, overflow: TextOverflow.ellipsis),
    );
  }

  Widget _buildVoteAverage(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 8, top: 4, right: 8, bottom: 8),
      child: Row(
        children: [
          Text(
            item.voteAverage.toString(),
            style:
                Theme.of(context).textTheme.bodyText2?.copyWith(fontSize: 12),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 4),
              child: RatingBar(rating: item.voteAverage),
            ),
          ),
        ],
      ),
    );
  }
}
