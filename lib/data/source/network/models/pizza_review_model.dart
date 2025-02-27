import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';

part 'pizza_review_model.freezed.dart';
part 'pizza_review_model.g.dart';

@freezed
class PizzaReviewModel with _$PizzaReviewModel {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory PizzaReviewModel({
    // Change from "summaries" to "summary" to match API
    @JsonKey(name: 'summary') Map<String, PizzaTypeSummary>? summaries,
    @Default([]) List<Review?>? reviews,
    String? userId,
  }) = _PizzaReviewModel;

  factory PizzaReviewModel.fromJson(Map<String, Object?> json) =>
      _$PizzaReviewModelFromJson(json);
}

@freezed
class PizzaTypeSummary with _$PizzaTypeSummary {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory PizzaTypeSummary({
    required CrustSummary crust,
    required SauceSummary sauce,
    required CheeseSummary cheese,
    required int count, // Number of reviews for this pizza type
  }) = _PizzaTypeSummary;

  factory PizzaTypeSummary.fromJson(Map<String, Object?> json) =>
      _$PizzaTypeSummaryFromJson(json);
}

@freezed
class CrustSummary with _$CrustSummary {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory CrustSummary({
    required int thin,
    required int thick,
    required int average,
    required int crispy,  // Kept as int because it's a percentage (100 = fully crispy)
    required int dry,     // Kept as int because it's a percentage
    required int fluffy,
  }) = _CrustSummary;

  factory CrustSummary.fromJson(Map<String, Object?> json) =>
      _$CrustSummaryFromJson(json);
}

@freezed
class SauceSummary with _$SauceSummary {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory SauceSummary({
    required int sweet,
    required int spicy,
    required int noflavour,
  }) = _SauceSummary;

  factory SauceSummary.fromJson(Map<String, Object?> json) =>
      _$SauceSummaryFromJson(json);
}

@freezed
class CheeseSummary with _$CheeseSummary {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory CheeseSummary({
    required int heavy,
    required int light,
    required int average,
  }) = _CheeseSummary;

  factory CheeseSummary.fromJson(Map<String, Object?> json) =>
      _$CheeseSummaryFromJson(json);
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

  factory Review.fromJson(Map<String, Object?> json) =>
      _$ReviewFromJson(json);
}

@freezed
class CrustReview with _$CrustReview {
  @JsonSerializable(fieldRename: FieldRename.none)
  const factory CrustReview({
    required String? thickness,
    required bool crispy,
    bool? dry,      // ✅ Change from `required bool` to `bool?`
    bool? fluffy,
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
