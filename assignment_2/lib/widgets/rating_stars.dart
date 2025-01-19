import 'package:flutter/material.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double size;
  final Color filledColor;
  final Color emptyColor;

  const RatingStars({
    super.key,
    required this.voteAverage,
    this.size = 24,
    this.filledColor = Colors.amber,
    this.emptyColor = const Color.fromARGB(133, 158, 158, 158),
  });

  @override
  Widget build(BuildContext context) {
    // 10점 만점을 5점 만점으로 변환
    final starCount = voteAverage / 2;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        if (index < starCount.floor()) {
          // 완전히 채워진 별
          return Icon(
            Icons.star,
            color: filledColor,
            size: size,
          );
        } else if (index == starCount.floor() && starCount % 1 != 0) {
          // 반만 채워진 별
          return Icon(
            Icons.star_half,
            color: filledColor,
            size: size,
          );
        } else {
          // 빈 별
          return Icon(
            Icons.star,
            color: emptyColor,
            size: size,
          );
        }
      }),
    );
  }
}
