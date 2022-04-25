import 'package:flutter/material.dart';
import 'package:flutter_movie_db/generated/l10n.dart';
import 'package:flutter_movie_db/widget/brightness_toggle.dart';

class MovieSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  static const _bonusHeight = 80;

  final double statusBarHeight;

  MovieSliverAppBarDelegate({required this.statusBarHeight});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Column(
      children: [
        _buildAppBar(context),
        _buildSearch(context, shrinkOffset),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Good morning'),
          Text("Robert", style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
      actions: const [
        BrightnessToggle(),
        SizedBox(width: 8),
      ],
    );
  }

  Widget _buildSearch(BuildContext context, double shrinkOffset) {
    return Opacity(
      opacity: 1 - shrinkOffset / maxExtent,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Row(
            children: [
              const Icon(Icons.search),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(
                  S.current.home_search_hint,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => kToolbarHeight + statusBarHeight + _bonusHeight;

  @override
  double get minExtent => kToolbarHeight + statusBarHeight + _bonusHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
