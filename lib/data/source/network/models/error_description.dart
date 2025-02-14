import 'package:json_annotation/json_annotation.dart';

part 'error_description.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class ErrorDescription {
  final String? errorType;
  final List<String>? messages;

  ErrorDescription({
    required this.errorType,
    required this.messages,
  });

  factory ErrorDescription.fromJson(Map<String, dynamic> json) => _$ErrorDescriptionFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDescriptionToJson(this);
}
