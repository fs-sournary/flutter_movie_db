import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final double rating;
  final double defaultRating;
  final int count;
  final double iconSize;
  final double separatorSize;
  final Color? color;

  const RatingBar({
    Key? key,
    required this.rating,
    this.defaultRating = 10,
    this.count = 5,
    this.iconSize = 14,
    this.separatorSize = 0,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratingPerItem = defaultRating / count;
    final defaultColor = Theme.of(context).primaryColor;
    return SizedBox(
      height: iconSize,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _buildRatingItem(
          context: context,
          index: index,
          ratingPerItem: ratingPerItem,
          defaultColor: defaultColor,
        ),
        separatorBuilder: (context, index) => SizedBox(width: separatorSize),
        itemCount: count,
      ),
    );
  }

  Widget _buildRatingItem({
    required BuildContext context,
    required int index,
    required double ratingPerItem,
    required Color defaultColor,
  }) {
    final indexRating = index * ratingPerItem;
    if (indexRating > rating - 1 && indexRating < rating) {
      return Icon(
        Icons.star_half,
        size: iconSize,
        color: color ?? defaultColor,
      );
    } else if (indexRating <= rating) {
      return Icon(Icons.star, size: iconSize, color: color ?? defaultColor);
    } else {
      return Icon(Icons.star_border, size: iconSize);
    }
  }
}
