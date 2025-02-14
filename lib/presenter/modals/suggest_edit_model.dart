import 'package:flutter/material.dart';
import 'package:pizzajournals/data/source/network/models/pizza_place_model.dart';
import 'package:pizzajournals/presenter/modals/modal.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';

import '../pages/discover/edit_place.dart';

class SuggestEditModal extends StatelessWidget {
  final PizzaPlaceModel pizzaPlace;

  const SuggestEditModal({
    super.key,
    required this.pizzaPlace,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.3,
      builder: (_, scrollController) {
        return Material(
          child: Modal(
            title: 'Suggest Edit',
            showRightExitButton: true,
            onRightExitButtonPressed: () => Navigator.of(context).pop(),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Change Name or other details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Edit Name, Location, hours etc',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Cancel'),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.main,
                            foregroundColor: Colors.white,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditPlacePage(
                                  pizzaPlace: pizzaPlace,
                                ),
                              ),
                            );
                          },
                          child: const Text('Continue'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
