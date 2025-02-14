import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:intl/intl.dart';

extension StringX on String {
  String get sha256Value {
    var bytes = utf8.encode(this);
    return '${sha256.convert(bytes)}';
  }

  Map<String, dynamic> get jsonData {
    try {
      return jsonDecode(this);
    } catch (_) {}
    return {};
  }

  String get convertDateFormat {
    DateTime dateTime = DateTime.parse(this);
    String formattedDate = DateFormat('dd MMM yyyy').format(dateTime);
    return formattedDate;
  }

  String get flagUrl {
    return isNotEmpty ? 'assets/flags/${toLowerCase()}.png' : '';
  }

  String get formatCoordinate {
    List<String> parts = split(',');

    double latitude = double.parse(parts[0]);
    double longitude = double.parse(parts[1]);

    String latitudeDirection = latitude >= 0 ? 'N' : 'S';
    String longitudeDirection = longitude >= 0 ? 'E' : 'W';
    String formattedCoordinate =
        '${latitude.abs()}° $latitudeDirection, ${longitude.abs()}° $longitudeDirection';

    return formattedCoordinate;
  }

  List<String> get extractIds {
    RegExp regex = RegExp(r'id:\s*([\d, ]+)');
    Iterable<Match> matches = regex.allMatches(this);

    List<String> ids = [];

    for (Match match in matches) {
      String idsString = match.group(1)!; // Get the captured group
      List<String> extractedIds = idsString
          .split(RegExp(r'[, ]+'))
          .map((id) => id.trim())
          .where((id) => id.isNotEmpty)
          .toList();
      ids.addAll(extractedIds);
    }

    return ids;
  }
}
