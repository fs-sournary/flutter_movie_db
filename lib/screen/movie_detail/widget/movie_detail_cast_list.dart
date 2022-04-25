import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_movie_db/model/casts_and_crews.dart';
import 'package:flutter_movie_db/screen/movie_detail/bloc/movie_detail_bloc.dart';
import 'package:flutter_movie_db/widget/custom_network_image.dart';

class MovieDetailCastList extends StatelessWidget {
  const MovieDetailCastList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieDetailBloc, MovieDetailState>(
      buildWhen: (previous, current) {
        return previous.castsAndCrews.cast != current.castsAndCrews.cast;
      },
      builder: (context, state) {
        final castsAndCrews = state.castsAndCrews;
        final casts = castsAndCrews.cast;
        return SizedBox(
          height: 300,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            itemBuilder: (context, index) => _CastItem(
              onItemClicked: (id) {},
              item: casts[index],
            ),
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: casts.length,
          ),
        );
      },
    );
  }
}

class _CastItem extends StatelessWidget {
  const _CastItem({
    Key? key,
    required this.onItemClicked,
    required this.item,
  }) : super(key: key);

  final Function(int) onItemClicked;
  final Cast item;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onItemClicked.call(item.id),
      child: SizedBox(
        width: 160,
        child: Card(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          elevation: 2.0,
          child: Column(
            children: [
              Expanded(
                child: CustomNetworkImage(
                  width: double.infinity,
                  path: item.profilePath,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(left: 8, top: 8, right: 8),
                child: Text(
                  item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
