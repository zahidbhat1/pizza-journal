import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pizzajournals/data/source/network/models/user_model.dart';

part 'profile_event.freezed.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  //Profile
  const factory ProfileEvent.load({
    UserModel? user,
  }) = ProfileLoad;

  const factory ProfileEvent.logout() = ProfileLogout;

  const factory ProfileEvent.refresh() = ProfileRefresh;

  const factory ProfileEvent.addProfileImage(File? image) = AddProfileImage;

  const factory ProfileEvent.updateProfile(Map<String, dynamic> data) =
      UpdateProfile;
  const factory ProfileEvent.loadSearches() = LoadSearches;
  const factory ProfileEvent.deleteSearch(String searchId) = DeleteSearch;
}
