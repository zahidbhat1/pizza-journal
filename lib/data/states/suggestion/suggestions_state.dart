import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/place_suggestion_model.dart';

part 'suggestions_state.freezed.dart';

@freezed
class SuggestionsState with _$SuggestionsState {
  const factory SuggestionsState({
    @Default([]) List<PlaceSuggestion> suggestions,
    @Default(false) bool isLoading,
    String? error,
  }) = _SuggestionsState;
}
