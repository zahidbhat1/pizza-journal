import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ExpandableAddress extends StatefulWidget {
  final String? pizzaPlaceName; // Add this parameter
  final String? street;
  final String? city;
  final String? zip;

  const ExpandableAddress({
    Key? key,
    required this.street,
    required this.city,
     this.zip,
    this.pizzaPlaceName, // Add this parameter
  }) : super(key: key);

  @override
  _ExpandableAddressState createState() => _ExpandableAddressState();
}

class _ExpandableAddressState extends State<ExpandableAddress> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isExpanded = !_isExpanded;
        });
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Display the pizza place name if available

          const SizedBox(height: 8),

          if (widget.pizzaPlaceName != null)
// Add spacing between name and address
          Text(
            widget.pizzaPlaceName!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            widget.street ?? "No street available",
            overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            maxLines: _isExpanded ? null : 1,
            style: const TextStyle(color: Colors.black),
          ),
          Text(
            widget.city ?? "No city available",
            overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            maxLines: _isExpanded ? null : 1,
            style: const TextStyle(color: Colors.black),

          ),
          Text(
            widget.zip ?? "11111",
            overflow: _isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            maxLines: _isExpanded ? null : 1,
            style: const TextStyle(color: Colors.black),
          ),
        ],
      ),
    );
  }
}