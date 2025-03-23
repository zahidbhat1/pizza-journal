import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizzajournals/data/source/network/models/pizza_place_model.dart';
import 'package:pizzajournals/data/states/discover/discover_bloc.dart';
import 'package:pizzajournals/data/states/discover/discover_event.dart';
import 'package:pizzajournals/presenter/themes/colors.dart';

class EditPlacePage extends StatefulWidget {
  final PizzaPlaceModel pizzaPlace;

  const EditPlacePage({
    super.key,
    required this.pizzaPlace,
  });

  @override
  State<EditPlacePage> createState() => _EditPlacePageState();
}

class _EditPlacePageState extends State<EditPlacePage> {
  late TextEditingController nameController;
  late TextEditingController streetController;
  late TextEditingController cityController;
  late TextEditingController stateController;
  late TextEditingController zipController;
  late TextEditingController phoneController;
  late TextEditingController websiteController;

  // Initialize hours map
  late Map<String, String> hoursOpen;

  @override
  void initState() {
    super.initState();
    // Initialize text controllers
    nameController = TextEditingController(text: widget.pizzaPlace.name);
    streetController =
        TextEditingController(text: widget.pizzaPlace.address?.street);
    cityController =
        TextEditingController(text: widget.pizzaPlace.address?.city);
    stateController =
        TextEditingController(text: widget.pizzaPlace.address?.state);
    zipController = TextEditingController(text: widget.pizzaPlace.address?.zip);
    phoneController = TextEditingController(text: widget.pizzaPlace.phone);
    websiteController = TextEditingController(
        text: widget.pizzaPlace.links?.social?.toString() ?? '');

    // Initialize hours with existing data or defaults
    hoursOpen = {};
    if (widget.pizzaPlace.hoursOpen != null) {
      hoursOpen = Map<String, String>.from(widget.pizzaPlace.hoursOpen!);
    }
  }

  @override
  void dispose() {
    // Dispose controllers
    nameController.dispose();
    streetController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    phoneController.dispose();
    websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Initial hoursOpen from widget: ${widget.pizzaPlace.hoursOpen}');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Place Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Place Name Section
            const Text('Place Name',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),

            // Address Section
            const Text('Address',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: streetController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Street',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: cityController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'City',
              ),
            ),
            const SizedBox(height: 8),
            // TextField(
            //   controller: stateController,
            //   decoration: const InputDecoration(
            //     border: OutlineInputBorder(),
            //     labelText: 'State',
            //   ),
            // ),
            // const SizedBox(height: 8),
            TextField(
              controller: zipController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ZIP',
              ),
            ),
            // const SizedBox(height: 16),

            // Hours Section
            GestureDetector(
              onTap: _showHoursBottomSheet,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Business Hours',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        size: 16, color: Colors.grey[600]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Contact Section
            const Text('Contact',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Phone',
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: websiteController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Website',
              ),
            ),
            const SizedBox(height: 24),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.main,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: _submitEdit,
                child: const Text('Submit Changes'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showHoursBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      // Makes the modal take up the full available height
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setModalState) {
            return DraggableScrollableSheet(
              initialChildSize: 0.7,
              minChildSize: 0.5,
              maxChildSize: 0.9,
              expand: false,
              builder: (context, scrollController) {
                return _buildHoursSection(setModalState, scrollController);
              },
            );
          },
        );
      },
    );
  }

  Widget _buildHoursSection(
    void Function(void Function()) setModalState,
    ScrollController scrollController,
  ) {
    final days = [
      'Sunday',
      'Monday',
      'Tuesday',
      'Wednesday',
      'Thursday',
      'Friday',
      'Saturday'
    ];

    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Business Hours',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView(
              controller: scrollController,
              children: days.map((day) {
                // Get the existing hours for this day
                final lowerDay = day.toLowerCase();
                final hours = hoursOpen[lowerDay] ?? 'Closed';

                return Card(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  child: ListTile(
                    title: Text(day),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        // Display the existing hours
                        Text(
                          hours,
                          style: const TextStyle(fontSize: 14),
                        ),
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () =>
                              _showTimeRangeDialog(day, setModalState),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  void _showTimeRangeDialog(
    String day,
    void Function(void Function()) setModalState,
  ) async {
    // Get current hours for this day
    final lowerDay = day.toLowerCase();
    final currentHours = hoursOpen[lowerDay] ?? 'Closed';

    TimeOfDay? initialOpenTime;
    TimeOfDay? initialCloseTime;

    // Parse existing hours if not "Closed"
    if (currentHours != 'Closed') {
      try {
        final times = currentHours.split(' - ');
        if (times.length == 2) {
          initialOpenTime = _parseTimeString(times[0]);
          initialCloseTime = _parseTimeString(times[1]);
        }
      } catch (e) {
        print('Error parsing time: $e');
      }
    }

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Set Hours for $day'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Show current hours
            if (currentHours != 'Closed')
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  'Current Hours: $currentHours',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),

            ElevatedButton(
              onPressed: () async {
                final openTime = await showTimePicker(
                  context: context,
                  initialTime:
                      initialOpenTime ?? const TimeOfDay(hour: 10, minute: 0),
                );
                if (openTime != null) {
                  final closeTime = await showTimePicker(
                    context: context,
                    initialTime: initialCloseTime ??
                        const TimeOfDay(hour: 21, minute: 0),
                  );
                  if (closeTime != null) {
                    setState(() {
                      hoursOpen[lowerDay] =
                          '${openTime.format(context)} - ${closeTime.format(context)}';
                    });
                    setModalState(() {});
                    Navigator.pop(context);
                  }
                }
              },
              child: const Text('Set Hours'),
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                setState(() {
                  hoursOpen[lowerDay] = 'Closed';
                });
                setModalState(() {});
                Navigator.pop(context);
              },
              child: const Text('Mark as Closed'),
            ),
          ],
        ),
      ),
    );
  }

  TimeOfDay? _parseTimeString(String timeStr) {
    try {
      // Parse time string like "10:00 AM" or "9:00 PM"
      final parts = timeStr.trim().split(' ');
      if (parts.length != 2) return null;

      final timeParts = parts[0].split(':');
      if (timeParts.length != 2) return null;

      var hour = int.parse(timeParts[0]);
      final minute = int.parse(timeParts[1]);
      final isPM = parts[1].toUpperCase() == 'PM';

      if (isPM && hour != 12) {
        hour += 12;
      } else if (!isPM && hour == 12) {
        hour = 0;
      }

      return TimeOfDay(hour: hour, minute: minute);
    } catch (e) {
      print('Error parsing time: $e');
      return null;
    }
  }

  void _submitEdit() {
    final data = {
      "name": nameController.text,
      "address": {
        "street": streetController.text,
        "city": cityController.text,
        "state": stateController.text,
        "zip": zipController.text
      },
      "hoursOpen": hoursOpen,
      "phone": phoneController.text,
      "website": websiteController.text,
      "pizzaPlace": widget.pizzaPlace.id,
    };

    context.read<DiscoverBloc>().add(
          DiscoverEvent.submitEdit(
            data: data,
          ),
        );
    Navigator.pop(context);
  }
}
