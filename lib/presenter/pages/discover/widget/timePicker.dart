import 'package:flutter/material.dart';

class TimePickerDialog extends StatefulWidget {
  final String initialTime;
  final Function(String) onSave;

  const TimePickerDialog({
    super.key,
    required this.initialTime,
    required this.onSave,
  });

  @override
  State<TimePickerDialog> createState() => _TimePickerDialogState();
}

class _TimePickerDialogState extends State<TimePickerDialog> {
  late bool isClosed;
  TimeOfDay? openTime;
  TimeOfDay? closeTime;

  @override
  void initState() {
    super.initState();
    isClosed = widget.initialTime == 'Closed';
    if (!isClosed) {
      final times = widget.initialTime.split(' - ');
      if (times.length == 2) {
        openTime = _parseTimeString(times[0]);
        closeTime = _parseTimeString(times[1]);
      }
    }
  }

  TimeOfDay _parseTimeString(String timeStr) {
    final components = timeStr.toLowerCase().split(' ');
    final time = components[0].split(':');
    int hour = int.parse(time[0]);
    final minute = int.parse(time[1]);

    if (components[1] == 'pm' && hour != 12) {
      hour += 12;
    } else if (components[1] == 'am' && hour == 12) {
      hour = 0;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  String _formatTimeOfDay(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour == 0 ? 12 : hour}:$minute $period';
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Set Hours'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CheckboxListTile(
            title: const Text('Closed'),
            value: isClosed,
            onChanged: (value) {
              setState(() {
                isClosed = value ?? false;
              });
            },
          ),
          if (!isClosed) ...[
            ListTile(
              title: const Text('Open Time'),
              trailing: Text(
                  openTime != null ? _formatTimeOfDay(openTime!) : 'Select'),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime: openTime ?? const TimeOfDay(hour: 9, minute: 0),
                );
                if (time != null) {
                  setState(() {
                    openTime = time;
                  });
                }
              },
            ),
            ListTile(
              title: const Text('Close Time'),
              trailing: Text(
                  closeTime != null ? _formatTimeOfDay(closeTime!) : 'Select'),
              onTap: () async {
                final time = await showTimePicker(
                  context: context,
                  initialTime:
                      closeTime ?? const TimeOfDay(hour: 17, minute: 0),
                );
                if (time != null) {
                  setState(() {
                    closeTime = time;
                  });
                }
              },
            ),
          ],
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            final result = isClosed
                ? 'Closed'
                : '${_formatTimeOfDay(openTime!)} - ${_formatTimeOfDay(closeTime!)}';
            widget.onSave(result);
            Navigator.pop(context);
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
