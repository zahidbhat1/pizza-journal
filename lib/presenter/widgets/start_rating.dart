import 'package:flutter/material.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';

class StarRating extends StatefulWidget {
  final int initialRating; // Initial rating (e.g., 0 for no stars selected)
  final ValueChanged<int> onRatingSelected; // Callback to get selected rating

  const StarRating({
    Key? key,
    this.initialRating = 0,
    required this.onRatingSelected,
  }) : super(key: key);

  @override
  _StarRatingState createState() => _StarRatingState();
}

class _StarRatingState extends State<StarRating> {
  late int currentRating;

  @override
  void initState() {
    super.initState();
    currentRating = widget.initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              currentRating = index + 1; // Set rating to current star index + 1
            });
            widget.onRatingSelected(currentRating); // Notify parent widget
          },
          child: Icon(
            size: 30,
            currentRating > index
                ? Icons.star // Filled star for selected ratings
                : Icons
                    .star_border_outlined, // Outlined star for unselected ratings
            color: currentRating > index ? AppColors.green : AppColors.grey2,
          ),
        );
      }),
    );
  }
}
