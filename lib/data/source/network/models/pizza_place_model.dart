import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/address_model.dart';
import 'package:pizzajournals/data/source/network/models/pizza_review_model.dart';

part 'pizza_place_model.freezed.dart';
part 'pizza_place_model.g.dart';

@freezed
class PizzaPlaceModel with _$PizzaPlaceModel {
  @JsonSerializable(fieldRename: FieldRename.snake)
  factory PizzaPlaceModel({
    String? name,
    @JsonKey(name: 'hoursOpen') Map<String, String>? hoursOpen,
    String? phone,
    String? createdAt,
    @JsonKey(name: '_id') String? id,
    int? averageRating,
    int? ratings,
    AddressModel? address,
    Summary? summary,
    @Default([]) List photos,
    Links? links,
  }) = _PizzaPlaceModel;

  factory PizzaPlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PizzaPlaceModelFromJson(json);

  static PizzaPlaceModel fromJsonModel(Object? json) =>
      PizzaPlaceModel.fromJson(json as Map<String, dynamic>);
}

@freezed
class Links with _$Links {
  factory Links({
    String? social,
    String? maps,
  }) = _Links;

  factory Links.fromJson(Map<String, Object?> json) => _$LinksFromJson(json);
}
