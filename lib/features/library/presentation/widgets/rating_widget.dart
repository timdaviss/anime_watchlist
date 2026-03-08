import 'package:flutter/cupertino.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingWidget extends StatelessWidget {
  const RatingWidget({
    super.key,
    required this.initialRating,
    required this.onRatingUpdate,
  });

  final double initialRating;
  final ValueChanged<double> onRatingUpdate;

  @override
  Widget build(BuildContext context) {
    final initialStars = (initialRating / 2).clamp(0.0, 5.0);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingBar.builder(
          initialRating: initialStars,
          minRating: 0.5,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 22,
          unratedColor: CupertinoColors.systemGrey4,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2),
          itemBuilder: (context, index) => const Icon(
            CupertinoIcons.star_fill,
            color: CupertinoColors.systemYellow,
          ),
          onRatingUpdate: (value) => onRatingUpdate(value * 2),
        ),
        const SizedBox(width: 8),
        Text(
          initialRating > 0 ? initialRating.toStringAsFixed(1) : '--',
          style: const TextStyle(
            fontSize: 13,
            color: CupertinoColors.secondaryLabel,
          ),
        ),
      ],
    );
  }
}
