import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';

part 'pizza_review_model.freezed.dart';
part 'pizza_review_model.g.dart';

@freezed
class PizzaReviewModel with _$PizzaReviewModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory PizzaReviewModel({
    required Summary? summary,
    @Default([]) List<Review?>? reviews,
    required String? userId,
  }) = _PizzaReviewModel;

  factory PizzaReviewModel.fromJson(Map<String, Object?> json) =>
      _$PizzaReviewModelFromJson(json);
}

@freezed
class Summary with _$Summary {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Summary({
    required Sauce? sauce,
    required Cheese? cheese,
    required Crust? crust,
  }) = _Summary;

  factory Summary.fromJson(Map<String, Object?> json) =>
      _$SummaryFromJson(json);
}

@freezed
class Sauce with _$Sauce {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Sauce({
    required int? sauceSweet,
    required int? sauceSpicy,
    required int? sauceNoFlavour,
  }) = _Sauce;

  factory Sauce.fromJson(Map<String, Object?> json) => _$SauceFromJson(json);
}

@freezed
class Cheese with _$Cheese {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Cheese({
    required int? cheeseGreat,
    required int? cheeseEhh,
  }) = _Cheese;

  factory Cheese.fromJson(Map<String, Object?> json) => _$CheeseFromJson(json);
}

@freezed
class Crust with _$Crust {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Crust({
    required int? crustAverage,
    required int? crustThick,
    required int? crustThin,
  }) = _Crust;

  factory Crust.fromJson(Map<String, Object?> json) => _$CrustFromJson(json);
}

@freezed
class Review with _$Review {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory Review({
    required CrustReview? crust,
    required SauceReview? sauce,
    required CheeseReview? cheese,
    required String? id,
    required int? stars,
    required String? pizzaType,
    required String? description,
    @Default([]) List<String?>? photos,
    required UserModel? user,
    required String? pizzaPlace,
    required String? createdAt,
    required String? updatedAt,
  }) = _Review;

  factory Review.fromJson(Map<String, Object?> json) => _$ReviewFromJson(json);
}

@freezed
class CrustReview with _$CrustReview {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory CrustReview({
    @Default([]) List<String?>? thickness,
    required bool crispy,
  }) = _CrustReview;

  factory CrustReview.fromJson(Map<String, Object?> json) =>
      _$CrustReviewFromJson(json);
}

@freezed
class SauceReview with _$SauceReview {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory SauceReview({
    required String? sweetOrSpicy,
    required String? amount,
  }) = _SauceReview;

  factory SauceReview.fromJson(Map<String, Object?> json) =>
      _$SauceReviewFromJson(json);
}

@freezed
class CheeseReview with _$CheeseReview {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory CheeseReview({
    required String? amount,
    required String? taste,
  }) = _CheeseReview;

  factory CheeseReview.fromJson(Map<String, Object?> json) =>
      _$CheeseReviewFromJson(json);
}
