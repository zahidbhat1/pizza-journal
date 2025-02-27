import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pizzajournals/data/source/network/models/pizza_review_model.dart';

import '../../../themes/colors.dart';
class ReviewSummaryWidget extends StatelessWidget {
  final String pizzaType;
  final PizzaReviewModel? reviews;
  final Function() getCrispyPercentage;

  const ReviewSummaryWidget({
    Key? key,
    required this.pizzaType,
    required this.reviews,
    required this.getCrispyPercentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the summary for the selected pizza type
    final summary = reviews?.summaries?[pizzaType];

    // Extract percentages for "Fluffy" and "Dry" from the crust section
    final fluffyPercentage = summary?.crust.fluffy ?? 0;
    final dryPercentage = summary?.crust.dry ?? 0;
    final crispyPercentage = summary?.crust.crispy ?? 0 ;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: summary == null
            ? _buildNoSummaryMessage() // Show the no-summary message
            : _buildSummaryContent(summary, fluffyPercentage, dryPercentage, crispyPercentage), // Show the summary content
      ),
    );
  }

  Widget _buildNoSummaryMessage() {
    return SizedBox(
      height: 100, // Fixed height for the message
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.info,
              size: 30,
              color: AppColors.grey,
            ),
            const SizedBox(height: 8),
            const Text(
              "No summary available",
              style: TextStyle(
                fontSize: 14,
                color: AppColors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              "Be the first to write a review!",
              style: TextStyle(
                fontSize: 12,
                color: AppColors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryContent(
      PizzaTypeSummary summary,
      int fluffyPercentage,
      int dryPercentage,
      int crispyPercentage,
      ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Review Summary",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Crust"),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: _buildCrustMetrics(summary.crust),
                ),
              ],
            ),
            const Spacer(),
            Column(

              children: [
                const Text("Crispy"),
                Text("$crispyPercentage%"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 10),
        _buildSauceMetrics(summary.sauce, dryPercentage),
        const SizedBox(height: 10),
        _buildCheeseMetrics(summary.cheese, fluffyPercentage),
        const SizedBox(height: 10),
      ],
    );
  }

  Widget _buildCrustMetrics(CrustSummary crust) {
    return Column(
      children: [
        Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Thick"),
                Text("Thin"),
                Text("Average"),
              ],
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                _buildProgressBar(
                  crust.thick.toDouble(),
                  AppColors.main,
                ),
                const SizedBox(height: 10),
                _buildProgressBar(
                  crust.thin.toDouble(),
                  AppColors.orange,
                ),
                const SizedBox(height: 10),
                _buildProgressBar(
                  crust.average.toDouble(),
                  AppColors.lightOrange,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSauceMetrics(SauceSummary sauce, int dryPercentage) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Sauce"),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Sweet"),
                      Text("Spicy"),
                      Text("No flavor"),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      _buildProgressBar(
                        sauce.sweet.toDouble(),
                        AppColors.main,
                      ),
                      const SizedBox(height: 10),
                      _buildProgressBar(
                        sauce.spicy.toDouble(),
                        AppColors.orange,
                      ),
                      const SizedBox(height: 10),
                      _buildProgressBar(
                        sauce.noflavour.toDouble(),
                        AppColors.lightOrange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            const Text("Dry"),
            Text("$dryPercentage%"), // Display dry percentage from crust
          ],
        ),
      ],
    );
  }

  Widget _buildCheeseMetrics(CheeseSummary cheese, int fluffyPercentage) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Cheese"),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Heavy"),
                      Text("Light"),
                      Text("Average"),
                    ],
                  ),
                  const SizedBox(width: 20),
                  Column(
                    children: [
                      _buildProgressBar(
                        cheese.heavy.toDouble(),
                        AppColors.main,
                      ),
                      const SizedBox(height: 10),
                      _buildProgressBar(
                        cheese.light.toDouble(),
                        AppColors.orange,
                      ),
                      const SizedBox(height: 10),
                      _buildProgressBar(
                        cheese.average.toDouble(),
                        AppColors.lightOrange,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            const Text("Fluffy"),
            Text("$fluffyPercentage%"), // Display fluffy percentage from crust
          ],
        ),
      ],
    );
  }

  Widget _buildProgressBar(double value, Color color) {
    return Stack(
      children: [
        Container(
          width: 80,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.grey2,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        Container(
          width: (value / 100) * 80,
          height: 8,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }
}