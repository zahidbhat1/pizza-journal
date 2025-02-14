import 'package:flutter/material.dart';

class SingleSelectableCheckbox extends StatefulWidget {
  const SingleSelectableCheckbox({super.key, required this.onSubmit});

  final ValueChanged<String> onSubmit;

  @override
  _SingleSelectableCheckboxState createState() =>
      _SingleSelectableCheckboxState();
}

class _SingleSelectableCheckboxState extends State<SingleSelectableCheckbox> {
  String? selectedOption = 'Yes'; // Track the selected option

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: selectedOption == 'Yes',
          onChanged: (_) {
            setState(() {
              selectedOption = selectedOption == 'Yes' ? 'No' : 'Yes';
              widget.onSubmit(selectedOption!);
            });
          },
        ),
        const Text("Yes"),
        Checkbox(
          value: selectedOption == 'No',
          onChanged: (_) {
            setState(() {
              selectedOption = selectedOption == 'No' ? 'Yes' : 'No';
              widget.onSubmit(selectedOption!);
            });
          },
        ),
        const Text("No"),
      ],
    );
  }
}
