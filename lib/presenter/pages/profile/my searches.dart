import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/states/profile/profile_bloc.dart';
import '../../../data/states/profile/profile_event.dart';
import '../../../data/states/profile/profile_state.dart';
import '../../navigation/navigation.dart';
@RoutePage()
class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();

}


class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    // ✅ Dispatch the event to load searches when the page is opened
    context.read<ProfileBloc>().add(const LoadSearches());
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('My Searches'),
          ),
          body: Builder(
            builder: (context) {
              if (state.isLoadingSearches) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.searches.isEmpty) {
                return const Center(
                  child: Text(
                    'No searches yet!',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              }

              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.searches.length,
                itemBuilder: (context, index) {
                  final search = state.searches[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (search.searchCustomName != null)
                            Text(
                              search.searchCustomName!,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          if (search.placeName != null) ...[
                            const SizedBox(height: 8),
                            Text(
                              search.placeName!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                          const SizedBox(height: 8),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: [
                              if (search.pizzaType != null)
                                _buildDetailChip('pizza type: ${search.pizzaType} '),
                              if (search.minRating != null)
                                _buildDetailChip('Rating: ${search.minRating} Star'),
                              if (search.sauceSweetOrSpicy != null)
                                _buildDetailChip('Sauce: ${search.sauceSweetOrSpicy}'),
                              if (search.sauceAmount != null)
                                _buildDetailChip('Sauce Amount: ${search.sauceAmount}'),
                              if (search.cheeseAmount != null)
                                _buildDetailChip('Cheese Amount: ${search.cheeseAmount}'),
                              if (search.cheeseTaste != null)
                                _buildDetailChip('Cheese Taste: ${search.cheeseTaste}'),
                              if (search.crustThickness != null)
                                _buildDetailChip('Crust: ${search.crustThickness}'),
                              if (search.crustCrispy != null)
                                _buildDetailChip('Crispy: ${search.crustCrispy! ? 'Yes' : 'No'}'),
                              if (search.crustDry != null)
                                _buildDetailChip('crust Dry: ${search.crustDry! ? 'Yes' : 'No'}'),
                              if (search.crustFluffy != null)
                                _buildDetailChip('crust fluffy: ${search.crustFluffy! ? 'Yes' : 'No'}'),

                            ],
                          ),
                          const SizedBox(height: 8),

                          // Replace the current Align widgets for delete and search buttons with this:
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Search button on the left
                              ElevatedButton(
                                onPressed: () {
                                  // Navigate to DiscoverPage with search data
                                  context.router.push(
                                    DiscoverRoute(
                                      searchData: {
                                        'minRating': search.minRating?.toString() ?? '',
                                        'sauceSweetOrSpicy': search.sauceSweetOrSpicy?.toLowerCase() ?? '',
                                        'sauceAmount': search.sauceAmount?.toLowerCase() ?? '',
                                        'cheeseAmount': search.cheeseAmount?.toLowerCase() ?? '',
                                        'cheeseTaste': search.cheeseTaste?.toLowerCase() ?? '',
                                        'crustThickness': search.crustThickness?.toLowerCase() ?? '',
                                        'crustCrispy': search.crustCrispy?.toString().toLowerCase() ?? '',
                                        'crustDry': search.crustDry?.toString().toLowerCase() ?? '',
                                        'crustFluffy': search.crustFluffy?.toString().toLowerCase() ?? '',
                                        'placeName': search.placeName ?? '',
                                        'pizzaType': search.pizzaType ?? '',
                                      },
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFFF6347),
                                  foregroundColor: Color(0xFFFF6347),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  elevation: 2,
                                ),
                                child: const Text(
                                  'Search',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),

                              IconButton(
                                icon: const Icon(Icons.delete, color: Color(0xFFFF6347)),
                                onPressed: () {
                                  context.read<ProfileBloc>().add(DeleteSearch(search.id));
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildDetailChip(String label) {
    return Chip(
      label: Text(label),
      backgroundColor: Colors.grey[200],
      labelStyle: const TextStyle(fontSize: 14),
    );
  }
}