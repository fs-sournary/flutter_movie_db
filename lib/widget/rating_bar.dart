import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({
    Key? key,
    required this.rating,
    this.defaultRating = 10,
    this.count = 5,
    this.iconSize = 14,
    this.separatorSize = 0,
    this.color,
  }) : super(key: key);

  final double rating;
  final double defaultRating;
  final int count;
  final double iconSize;
  final double separatorSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ratingPerItem = defaultRating / count;
    final defaultColor = Theme.of(context).primaryColor;
    return SizedBox(
      height: iconSize,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _Item(
          index: index,
          rating: rating,
          iconSize: iconSize,
          ratingPerItem: ratingPerItem,
          defaultColor: defaultColor,
          color: color,
        ),
        separatorBuilder: (context, index) => SizedBox(width: separatorSize),
        itemCount: count,
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({
    Key? key,
    required this.index,
    required this.rating,
    required this.iconSize,
    required this.ratingPerItem,
    required this.defaultColor,
    this.color,
  }) : super(key: key);

  final int index;
  final double rating;
  final double iconSize;
  final double ratingPerItem;
  final Color defaultColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final itemRating = index * ratingPerItem;
    if ((itemRating + ratingPerItem / 4 <= rating) &&
        (rating < itemRating + ratingPerItem * 3 / 4)) {
      return Icon(
        Icons.star_half,
        size: iconSize,
        color: color ?? defaultColor,
      );
    } else if (rating < itemRating + ratingPerItem / 4) {
      return Icon(Icons.star_border, size: iconSize);
    } else {
      return Icon(Icons.star, size: iconSize, color: color ?? defaultColor);
    }
  }
}
