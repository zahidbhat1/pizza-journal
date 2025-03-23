import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/source/network/models/place_suggestion_model.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';

import '../../../data/states/suggestion/suggestions_bloc.dart';
import '../../../data/states/suggestion/suggestions_event.dart';
import '../../../data/states/suggestion/suggestions_state.dart';

@RoutePage()
class SuggestionsPage extends StatefulWidget {
  final String pizzaPlaceId;

  const SuggestionsPage({super.key, required this.pizzaPlaceId});

  @override
  State<SuggestionsPage> createState() => _SuggestionsPageState();
}

class _SuggestionsPageState extends State<SuggestionsPage> {
  @override
  void initState() {
    super.initState();
    context.read<SuggestionsBloc>().add(LoadSuggestions(widget.pizzaPlaceId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Suggestion List')),
      body: BlocBuilder<SuggestionsBloc, SuggestionsState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          }

          if (state.suggestions.isEmpty) {
            return const Center(child: Text('No suggestions available'));
          }

          return ListView.builder(
            itemCount: state.suggestions.length,
            itemBuilder: (context, index) {
              final suggestion = state.suggestions[index];
              return SuggestionCard(suggestion: suggestion);
            },
          );
        },
      ),
    );
  }
}

class SuggestionCard extends StatefulWidget {
  final PlaceSuggestion suggestion;

  const SuggestionCard({super.key, required this.suggestion});

  @override
  State<SuggestionCard> createState() => _SuggestionCardState();
}

class _SuggestionCardState extends State<SuggestionCard> {
  bool _expanded = false;

  String? formatHoursOpen(Map<String, String>? hours) {
    if (hours == null || hours.isEmpty) return null;

    final List<String> formattedHours = [];
    hours.forEach((day, time) {
      if (time.isNotEmpty) {
        // Capitalize first letter of day
        final capitalizedDay = day[0].toUpperCase() + day.substring(1);
        formattedHours.add('$capitalizedDay: $time');
      }
    });

    return formattedHours.isEmpty ? null : formattedHours.join(' | ');
  }

  Widget buildInfoRow(String label, String? value) {
    if (value == null || value.isEmpty) {
      return const SizedBox.shrink();
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        '$label: $value',
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final suggestion = widget.suggestion;

    return Card(
      margin: const EdgeInsets.all(8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Basic Information
            buildInfoRow('Update Name', suggestion.name),
            buildInfoRow('Update street', suggestion.address?.street),
            buildInfoRow('update city', suggestion.address?.city),
            buildInfoRow('By', suggestion.user?.screenName),
            buildInfoRow('zip', suggestion.address?.zip),


            // View More Button
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                },
                child: Text(_expanded ? 'View Less' : 'View More'),
              ),
            ),

            // Expanded Details
            if (_expanded) ...[
              const Divider(),
              buildInfoRow('Phone', suggestion.phone),
              buildInfoRow('Website', suggestion.website),
              buildInfoRow('Hours', formatHoursOpen(suggestion.hoursOpen)),
            ],

            const SizedBox(height: 16),

            // Approve & Reject Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => context
                      .read<SuggestionsBloc>()
                      .add(RejectSuggestion(suggestion.id!)),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.white),
                  child: const Text('Reject',
                      style: TextStyle(color: Colors.black)),
                ),
                ElevatedButton(
                  onPressed: () => context
                      .read<SuggestionsBloc>()
                      .add(ApproveSuggestion(suggestion.id!)),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: AppColors.main),
                  child: const Text('Approve',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
