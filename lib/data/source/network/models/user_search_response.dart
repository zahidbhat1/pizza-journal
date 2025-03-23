import 'package:freezed_annotation/freezed_annotation.dart';


part 'user_search_response.freezed.dart';
part 'user_search_response.g.dart';

@freezed
class UserSearchesResponse with _$UserSearchesResponse {
  const factory UserSearchesResponse({
    required bool success,
    required String message,
    required List<UserSearch> data,
  }) = _UserSearchesResponse;

  factory UserSearchesResponse.fromJson(Map<String, dynamic> json) =>
      _$UserSearchesResponseFromJson(json);
}

@freezed
class UserSearch with _$UserSearch {
  const factory UserSearch({
    @JsonKey(name: '_id') required String id,
    required String userId,
    String? searchCustomName,
    String? placeName,
    String? pizzaType,
    int? minRating,
    String? sauceSweetOrSpicy,
    String? sauceAmount,
    String? cheeseAmount,
    String? cheeseTaste,
    String? crustThickness,
    bool? crustCrispy,
    bool? crustDry,
    bool? crustFluffy,


    String? screenName,
    required DateTime createdAt,
    @JsonKey(name: '__v') required int version,
  }) = _UserSearch;

  factory UserSearch.fromJson(Map<String, dynamic> json) =>
      _$UserSearchFromJson(json);
}
