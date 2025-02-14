import 'package:freezed_annotation/freezed_annotation.dart';

part 'suggestions_event.freezed.dart';

@freezed
sealed class SuggestionsEvent with _$SuggestionsEvent {
  const factory SuggestionsEvent.loadSuggestions(String pizzaPlaceId) =
      LoadSuggestions;

  const factory SuggestionsEvent.approveSuggestion(String suggestionId) =
      ApproveSuggestion;

  const factory SuggestionsEvent.rejectSuggestion(String suggestionId) =
      RejectSuggestion;
}
