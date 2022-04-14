import 'package:flutter/material.dart';
import 'package:flutter_movie_db/common/app_color.dart';
import 'package:flutter_movie_db/generated/l10n.dart';

class MovieSliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  static const _bonusHeight = 80;

  final double statusBarHeight;

  MovieSliverAppBarDelegate({required this.statusBarHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Column(
      children: [
        _buildAppBar(),
        _buildSearch(shrinkOffset),
      ],
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text('Good morning'),
          SizedBox(height: 4),
          Text(
            "Robert",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
      backgroundColor: Colors.white,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.account_box_rounded, size: 40),
        ),
        const SizedBox(width: 12),
      ],
    );
  }

  Widget _buildSearch(double shrinkOffset) {
    return Opacity(
      opacity: 1 - shrinkOffset / maxExtent,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: wildSand,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.5,
              blurRadius: 4,
            ),
          ],
        ),
        child: Center(
          child: Row(
            children: [
              const Icon(Icons.search),
              Container(
                margin: const EdgeInsets.only(left: 12),
                child: Text(S.current.home_search_hint),
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
