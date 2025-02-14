import 'package:freezed_annotation/freezed_annotation.dart';

part 'address_model.freezed.dart';
part 'address_model.g.dart';

@freezed
class AddressModel with _$AddressModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory AddressModel({
    String? street,
    String? city,
    String? state,
    String? zip,
  }) = _AddressModel;

  factory AddressModel.fromJson(Map<String, Object?> json) =>
      _$AddressModelFromJson(json);

  static AddressModel fromJsonModel(Object? json) =>
      AddressModel.fromJson(json as Map<String, dynamic>);
}
