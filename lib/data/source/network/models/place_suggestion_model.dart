import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/address_model.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';

part 'place_suggestion_model.freezed.dart';
part 'place_suggestion_model.g.dart';

@freezed
class PlaceSuggestionsResponse with _$PlaceSuggestionsResponse {
  const factory PlaceSuggestionsResponse({
    required String status,
    required PlaceSuggestionsData data,
  }) = _PlaceSuggestionsResponse;

  factory PlaceSuggestionsResponse.fromJson(Map<String, dynamic> json) =>
      _$PlaceSuggestionsResponseFromJson(json);
}

@freezed
class PlaceSuggestionsData with _$PlaceSuggestionsData {
  const factory PlaceSuggestionsData({
    required List<PlaceSuggestion> suggestions,
  }) = _PlaceSuggestionsData;

  factory PlaceSuggestionsData.fromJson(Map<String, dynamic> json) =>
      _$PlaceSuggestionsDataFromJson(json);
}

@freezed
class PlaceSuggestion with _$PlaceSuggestion {
  const factory PlaceSuggestion({
    AddressModel? address,
    @JsonKey(name: 'hoursOpen') Map<String, String>? hoursOpen,
    Map<String, dynamic>? location,
    @JsonKey(name: '_id') String? id,
    String? name,
    String? phone,
    String? website,
    UserModel? user,
    String? pizzaPlace,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) = _PlaceSuggestion;

  factory PlaceSuggestion.fromJson(Map<String, dynamic> json) =>
      _$PlaceSuggestionFromJson(json);
}
