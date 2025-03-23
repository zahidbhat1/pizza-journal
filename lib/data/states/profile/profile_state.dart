import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';

import '../../source/network/models/user_search_response.dart';

part 'profile_state.freezed.dart';

enum ProfileTabType {
  checkins,
  bookmark,
}

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState({
    UserModel? user,
    File? selectedImage,
    String? uploadedImageUrl,
    @Default(false) bool isUpdating,
    @Default(false) bool isLoadingSearches,

    String? error,
    @Default([]) List<UserSearch> searches,
  }) = _ProfileState;
}
