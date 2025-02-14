import 'package:pizzajournals/utils/json_parser.dart';

class DataItem<T> {
  final String? code;
  final String? status;
  final bool success;
  final String? message;
  T? data;

  DataItem({
    required this.code,
    required this.status,
    required this.data,
    required this.success,
    required this.message,
  });

  factory DataItem.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT, {
    required String? dataJsonKeyName,
  }) {
    return DataItem<T>(
      code: JsonParser.stringOptionalValue(json['code']),
      status: JsonParser.stringOptionalValue(json['status']),
      success: JsonParser.boolOptionalValue(json['success']) ?? false,
      message: JsonParser.stringOptionalValue(json['message']),
      data: fromJsonT(json[dataJsonKeyName ?? 'data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'status': status,
      'message': message,
      'success': success,
      'data': data,
    };
  }
}
