import 'package:flutter/material.dart';
import 'package:flutter_movie_db/gen/assets.gen.dart';
import 'package:flutter_movie_db/screen/movie_detail/widget/movie_detail_page_view.dart';
import 'package:flutter_movie_db/widget/icon_background.dart';

class MovieDetailAppBarDelegate extends SliverPersistentHeaderDelegate {
  const MovieDetailAppBarDelegate({required this.statusBarHeight});

  final double statusBarHeight;

  static const double _expandedHeight = 440;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Stack(
      children: [
        const MovieDetailPageView(),
        _buildAppBar(context),
        _buildBottom(1 - shrinkOffset / _expandedHeight),
      ],
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return SizedBox(
      height: statusBarHeight + kToolbarHeight,
      child: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const IconBackground(
            child: Icon(Icons.arrow_back_ios, size: 13),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: IconBackground(child: Assets.images.icBagFilled.svg()),
            padding: EdgeInsets.zero,
          ),
          const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildBottom(double opacity) {
    return Positioned(
      left: 16,
      right: 16,
      bottom: 16,
      child: Opacity(
        opacity: opacity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 30, height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconBackground(child: Assets.images.icHeartFilled.svg()),
                const SizedBox(height: 16),
                IconBackground(
                  child: Assets.images.icShare.svg(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 8.5),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => _expandedHeight;

  @override
  double get minExtent => statusBarHeight + kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
