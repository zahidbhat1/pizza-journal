import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pizzajournals/data/repositories/user_repository.dart';
import 'package:pizzajournals/data/states/auth/auth_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_event.dart';
import 'package:pizzajournals/data/states/auth/auth_state.dart';
import 'package:pizzajournals/data/states/profile/profile_event.dart';
import 'package:pizzajournals/data/states/profile/profile_state.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';

@singleton
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final AppRouter _router;
  final UserRepository _userRepository;
  final AuthBloc _authBloc;

  ProfileBloc({
    required AppRouter router,
    required UserRepository userRepository,
    required AuthBloc authBloc,
  })  : _router = router,
        _userRepository = userRepository,
        _authBloc = authBloc,
        super(const ProfileState()) {
    // Listen to auth state changes
    _authBloc.stream.listen((authState) {
      if (authState.status == AuthStateStatus.unauthenticated) {
        // Clear the state when user logs out
        add(const ProfileEvent.load());
      }
    });

    on<ProfileLoad>(_onLoad);
    on<ProfileLogout>(_onLogout);
    on<AddProfileImage>(_onAddImage);
    on<UpdateProfile>(_onUpdateProfile);
    on<ProfileRefresh>(_onRefresh);
  }

  void _onAddImage(AddProfileImage event, Emitter<ProfileState> emit) async {
    if (event.image != null) {
      emit(state.copyWith(selectedImage: event.image, isUpdating: true));

      try {
        print("Uploading profile image..."); // Debug log
        final result = await _userRepository.uploadPhotos(files: [event.image]);

        if (result.success && result.data?.isNotEmpty == true) {
          final imageUrl = result.data!.first;
          print("Image uploaded successfully: $imageUrl"); // Debug log

          emit(state.copyWith(
            uploadedImageUrl: imageUrl,
            error: null,
          ));

          add(UpdateProfile({
            'picture': [imageUrl]
          }));
        }
      } catch (e) {
        print("Error uploading image: $e"); // Debug log
        emit(state.copyWith(error: e.toString()));
      } finally {
        emit(state.copyWith(isUpdating: false));
      }
    }
  }

  void _onUpdateProfile(UpdateProfile event, Emitter<ProfileState> emit) async {
    if (_authBloc.state.status == AuthStateStatus.unauthenticated) {
      await _actionIfNotLoggedIn();
      return;
    }

    emit(state.copyWith(isUpdating: true));

    try {
      print("Updating profile..."); // Debug log
      final userData = {...event.data};

      if (state.uploadedImageUrl != null) {
        userData['picture'] = [state.uploadedImageUrl!];
      }

      final result = await _userRepository.updateProfile(userData);

      if (result.success) {
        print("Profile updated successfully"); // Debug log
        emit(state.copyWith(
          isUpdating: false,
          error: null,
          uploadedImageUrl: null,
          user: state.user?.copyWith(
            screenName: userData['screenName'] ?? state.user?.screenName,
            picture: userData['picture']?.first ?? state.user?.picture,
          ),
        ));
      }
    } catch (e) {
      print("Error updating profile: $e"); // Debug log
      emit(state.copyWith(
        isUpdating: false,
        error: e.toString(),
      ));
    }
  }

  void _onLoad(ProfileLoad event, Emitter<ProfileState> emit) async {
    if (_authBloc.state.status == AuthStateStatus.unauthenticated) {
      emit(state.copyWith(
        isUpdating: false,
        user: null,
        error: null,
      ));
      await _router.replace(const WelcomeRoute());
      return;
    }

    emit(state.copyWith(isUpdating: true, error: null));

    try {
      print("Loading user profile..."); // Debug log
      final user = await _userRepository.getUser();

      if (user != null) {
        print("User profile loaded successfully"); // Debug log
        emit(state.copyWith(
          user: user,
          isUpdating: false,
          error: null,
        ));
      } else {
        print("Failed to load user profile"); // Debug log
        emit(state.copyWith(
          isUpdating: false,
          error: 'Failed to load user data',
        ));
      }
    } catch (e) {
      print("Error loading profile: $e"); // Debug log
      emit(state.copyWith(
        isUpdating: false,
        error: e.toString(),
        user: null,
      ));
    }
  }

  void _onLogout(ProfileLogout event, Emitter<ProfileState> emit) async {
    print("Logging out..."); // Debug log
    emit(state.copyWith(
      user: null,
      error: null,
      isUpdating: false,
      uploadedImageUrl: null,
      selectedImage: null,
    ));
    _authBloc.add(AuthLogout());
  }

  void _onRefresh(ProfileRefresh event, Emitter<ProfileState> emit) async {
    emit(const ProfileState());
    add(const ProfileEvent.load());
  }

  Future<void> _actionIfNotLoggedIn() async {
    if (_authBloc.state.status == AuthStateStatus.unauthenticated) {
      await Future.delayed(const Duration(milliseconds: 500));
      await _router.push(const WelcomeRoute());
    }
  }
}
