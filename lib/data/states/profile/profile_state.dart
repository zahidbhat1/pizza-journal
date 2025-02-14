import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';

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
    String? error,
  }) = _ProfileState;
}
