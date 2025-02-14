import 'package:pizzajournals/data/source/network/models/error_description.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_data.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ErrorData {
  final String? code;
  final String? status;
  final String? error;
  final String? message;
  final String? title;
  final dynamic description;

  ErrorData({
    required this.code,
    required this.status,
    required this.error,
    required this.message,
    required this.title,
    required this.description,
  });

  factory ErrorData.fromJson(Map<String, dynamic> json) => _$ErrorDataFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDataToJson(this);
}

extension ErrorDataX on ErrorData {
  String? get descriptionString {
    if (description != null && description is String) {
      return description;
    } else if (description != null && description is Map<String, dynamic>) {
      final errorData = ErrorDescription.fromJson(description);
      return errorData.messages?.join('\n') ?? '';
    }
    return null;
  }

  bool get hasError {
    final codeIsNotEmpty = code?.isNotEmpty ?? false;
    final statusIsNotEmpty = status?.isNotEmpty ?? false;
    final messageIsNotEmpty = message?.isNotEmpty ?? false;
    final errorIsNotEmpty = error?.isNotEmpty ?? false;
    final titleIsNotEmpty = title?.isNotEmpty ?? false;
    final descriptionIsNotEmpty = descriptionString?.isNotEmpty ?? false;

    if (codeIsNotEmpty && code != '200') return true;
    if (statusIsNotEmpty && status == 'error' && messageIsNotEmpty) return true;
    if (errorIsNotEmpty) return true;
    if (titleIsNotEmpty && descriptionIsNotEmpty) return true;
    return false;
  }

  String? get errorMessage {
    final codeIsNotEmpty = code?.isNotEmpty ?? false;
    final statusIsNotEmpty = status?.isNotEmpty ?? false;
    final messageIsNotEmpty = message?.isNotEmpty ?? false;
    final errorIsNotEmpty = error?.isNotEmpty ?? false;
    final titleIsNotEmpty = title?.isNotEmpty ?? false;
    final descriptionIsNotEmpty = descriptionString?.isNotEmpty ?? false;

    if (codeIsNotEmpty) return code;
    if (messageIsNotEmpty) return message;
    if (errorIsNotEmpty) return error;
    if (titleIsNotEmpty && descriptionIsNotEmpty) return descriptionString;
    if (titleIsNotEmpty) return title;
    if (descriptionIsNotEmpty) return descriptionString;
    if (statusIsNotEmpty) return status;
    return null;
  }
}
