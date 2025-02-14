import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pizzajournals/data/repositories/user_repository.dart';
import 'package:pizzajournals/data/states/suggestion/suggestions_event.dart';
import 'package:pizzajournals/data/states/suggestion/suggestions_state.dart';
import 'package:pizzajournals/utils/alert_manager.dart';

@singleton
class SuggestionsBloc extends Bloc<SuggestionsEvent, SuggestionsState> {
  final UserRepository _userRepository;
  final AlertManager _alertManager;

  SuggestionsBloc({
    required UserRepository userRepository,
    required AlertManager alertManager,
  })  : _userRepository = userRepository,
        _alertManager = alertManager,
        super(const SuggestionsState()) {
    on<LoadSuggestions>(_onLoadSuggestions);
    on<ApproveSuggestion>(_onApproveSuggestion);
    on<RejectSuggestion>(_onRejectSuggestion);
  }

  Future<void> _onLoadSuggestions(
    LoadSuggestions event,
    Emitter<SuggestionsState> emit,
  ) async {
    emit(state.copyWith(isLoading: true, error: null));

    try {
      final suggestions =
          await _userRepository.getSuggestions(event.pizzaPlaceId);
      emit(state.copyWith(suggestions: suggestions, isLoading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), isLoading: false));
    }
  }

  Future<void> _onApproveSuggestion(
    ApproveSuggestion event,
    Emitter<SuggestionsState> emit,
  ) async {
    try {
      await _userRepository.approveSuggestion(event.suggestionId);
      _alertManager.showSuccess(message: "Suggestion approved!");

      // Refresh the suggestions list
      emit(state.copyWith(
          suggestions: state.suggestions
              .where((s) => s.id != event.suggestionId)
              .toList()));
    } catch (e) {
      _alertManager.showError(message: "Failed to approve suggestion.");
    }
  }

  Future<void> _onRejectSuggestion(
    RejectSuggestion event,
    Emitter<SuggestionsState> emit,
  ) async {
    try {
      await _userRepository.rejectSuggestion(event.suggestionId);
      _alertManager.showSuccess(message: "Suggestion rejected!");

      // Remove rejected suggestion from state
      emit(state.copyWith(
          suggestions: state.suggestions
              .where((s) => s.id != event.suggestionId)
              .toList()));
    } catch (e) {
      _alertManager.showError(message: "Failed to reject suggestion.");
    }
  }
}
