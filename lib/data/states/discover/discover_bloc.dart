import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:pizzajournals/data/repositories/user_repository.dart';
import 'package:pizzajournals/data/states/action/action_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_state.dart';
import 'package:pizzajournals/data/states/discover/discover_event.dart';
import 'package:pizzajournals/data/states/discover/discover_state.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:pizzajournals/presenter/pages/discover/place_detail_arguments.dart';
import 'package:pizzajournals/utils/alert_manager.dart';

@singleton
class DiscoverBloc extends Bloc<DiscoverEvent, DiscoverState> {
  final AppRouter _router;
  final AuthBloc _authBloc;
  final ActionBloc _actionBloc;
  final AlertManager _alertManager;
  final UserRepository _userRepository;

  DiscoverBloc({
    required AppRouter router,
    required AuthBloc authBloc,
    required AlertManager alertManager,
    required UserRepository userRepository,
    required ActionBloc actionBloc,
  })  : _router = router,
        _authBloc = authBloc,
        _userRepository = userRepository,
        _alertManager = alertManager,
        _actionBloc = actionBloc,
        super(const DiscoverState()) {
    // Listen to auth state changes
    _authBloc.stream.listen((authState) {
      if (authState.status == AuthStateStatus.unauthenticated) {
        // Clear the state when user logs out
        add(const DiscoverEvent.refresh());
      } else if (authState.status == AuthStateStatus.authenticated) {
        add(const DiscoverEvent.refresh());
      }
    });

    on<DiscoverLoad>(_onLoad);
    on<DiscoverRefresh>(_onRefresh);
    on<DiscoverLoadUserPlaces>(_onLoadUserPlaces);
    on<DiscoverPizzaPlace>(_onPizzaPlace);
    on<DiscoverPizzaPlaceReviews>(_onPizzaPlaceReviews);
    on<DiscoverAddImage>(_onAddImage);
    on<DiscoverAddPlace>(_onAddPizzaPlace);
    on<DiscoverAddPlaceReview>(_onAddPizzaPlaceReview);
    on<DiscoverSuggestEdit>(_onSuggestEdit);
    on<DiscoverSubmitEdit>(_onSubmitEdit);
    on<DiscoverSearchLocations>(_onSearchLocations);
    // on<DiscoverFetchLocationFromPincode>(_onFetchLocationFromPincode);
    on<UpdateMapLocation>(_onUpdateMapLocation);
    on<LocationSelected>(_onLocationSelected);
  }

  void _onLoad(
    DiscoverLoad event,
    Emitter<DiscoverState> emit,
  ) async {
    emit(state.copyWith(showLoading: true));

    try {
      print("Fetching pizza places from API..."); // Debug log
      var dataList = await _userRepository.getPizzaPlaces(event.request);
      print("API Response: ${dataList.data}"); // Debug log

      emit(state.copyWith(
        showLoading: false,
        pizzaPlaces: dataList.data ?? [],
      ));
    } catch (e) {
      print("Error fetching pizza places: $e"); // Debug log
      emit(state.copyWith(
        showLoading: false,
        pizzaPlaces: [], // Clear places on error
      ));
      _alertManager.showError(title: 'Error', message: e.toString());
    }
  }

  @override
  Stream<DiscoverState> mapEventToState(DiscoverEvent event) async* {
    if (event is UpdateMapLocation) {
      yield state.copyWith(fetchedLocation: event.location);
    }
  }

  void _onLocationSelected(
    LocationSelected event,
    Emitter<DiscoverState> emit,
  ) async {
    emit(state.copyWith(
      street: event.street,
      pincode: event.pincode,
      city: event.city,
      stateName: event.state,
      country: event.country,
    ));
  }

  void _onUpdateMapLocation(
    UpdateMapLocation event,
    Emitter<DiscoverState> emit,
  ) async {
    // Simply update the fetchedLocation in state
    emit(state.copyWith(fetchedLocation: event.location));
  }

  void _onFetchLocationFromPincode(
    DiscoverFetchLocationFromPincode event,
    Emitter<DiscoverState> emit,
  ) async {
    print(
        "Fetching location for Pincode: ${event.pincode}"); // ✅ Print the entered pincode

    emit(state.copyWith(showLoading: true));

    try {
      final location =
          await _userRepository.getLocationFromPincode(event.pincode);

      print(
          "Fetched  in bloc Location: $location"); // ✅ Print the fetched location

      emit(state.copyWith(
        showLoading: false,
        fetchedLocation: location,
      ));
    } catch (e) {
      print("Error fetching location: $e");

      emit(state.copyWith(
        showLoading: false,
        fetchedLocation: null,
      ));

      _alertManager.showError(
          title: 'Error', message: 'Failed to fetch location');
    }
  }

  void _onLoadUserPlaces(
    DiscoverLoadUserPlaces event,
    Emitter<DiscoverState> emit,
  ) async {
    if (_authBloc.state.status == AuthStateStatus.unauthenticated) {
      emit(state.copyWith(
        showLoading: false,
        pizzaPlaces: [], // Clear places for unauthenticated users
      ));
      return;
    }

    emit(state.copyWith(showLoading: true));

    try {
      print("Fetching user places from API..."); // Debug log
      var dataList = await _userRepository.getUserPizzaPlaces();
      print("API Response: ${dataList.data}"); // Debug log

      emit(state.copyWith(
        showLoading: false,
        pizzaPlaces: dataList.data ?? [],
      ));
    } catch (e) {
      print("Error fetching user places: $e"); // Debug log
      emit(state.copyWith(
        showLoading: false,
        pizzaPlaces: [], // Clear places on error
      ));
      _alertManager.showError(title: 'Error', message: e.toString());
    }
  }

  void _onPizzaPlace(
    DiscoverPizzaPlace event,
    Emitter<DiscoverState> emit,
  ) async {
    emit(state.copyWith(reviews: null));
    _router.push(
      PizzaPlaceRoute(
        arguments: PizzaPlaceArguments(pizzaPlaceModel: event.pizzaPlaceModel),
      ),
    );
  }

  void _onPizzaPlaceReviews(
    DiscoverPizzaPlaceReviews event,
    Emitter<DiscoverState> emit,
  ) async {
    emit(state.copyWith(showLoading: true));
    emit(state.copyWith(myReview: null));

    try {
      var dataList = await _userRepository.getPizzaPlaceReviews(
        placeId: event.pizzaPlaceModel?.id ?? '',
      );

      emit(state.copyWith(
        reviews: dataList,
        showLoading: false,
      ));

      if (_authBloc.state.status == AuthStateStatus.authenticated) {
        try {
          var myReview = dataList.reviews?.firstWhere(
            (review) => review?.user?.id == _authBloc.state.user?.id,
          );
          emit(state.copyWith(myReview: myReview));
        } catch (e) {
          emit(state.copyWith(myReview: null));
        }
      }
    } catch (e) {
      print("Error fetching reviews: $e"); // Debug log
      emit(state.copyWith(
        showLoading: false,
        reviews: null,
      ));
      _alertManager.showError(title: 'Error', message: e.toString());
    }
  }

  void _onAddImage(
    DiscoverAddImage event,
    Emitter<DiscoverState> emit,
  ) async {
    List<File?> updatedImages = List.from(state.images);
    if (event.index == state.images.length) {
      updatedImages.add(event.image);
    } else {
      updatedImages[event.index] = event.image;
    }
    emit(state.copyWith(images: updatedImages));
  }

  void _onAddPizzaPlace(
    DiscoverAddPlace event,
    Emitter<DiscoverState> emit,
  ) async {
    if (_authBloc.state.status == AuthStateStatus.unauthenticated) {
      _actionIfNotLoggedIn();
      return;
    }

    try {
      emit(state.copyWith(isAddingPlace: true));

      print(
          'Starting image upload with ${state.images?.length ?? 0} images'); // Debug log

      final uploadResponse = await _userRepository.uploadPhotos(
        files: state.images ?? [],
      );

      print('Upload Response: $uploadResponse'); // Debug log

      if (uploadResponse.data == null || uploadResponse.data!.isEmpty) {
        throw Exception('Failed to upload images: No URLs returned');
      }

      Map<String, dynamic> formData = Map<String, dynamic>.from(event.data);
      formData['photos'] = jsonEncode(uploadResponse.data);

      print('Final form data: $formData'); // Debug log

      await _userRepository.addPizzaPlace(
        data: formData,
        files: [],
      );

      _alertManager.showSuccess(
        title: 'Success',
        message: 'Place added successfully',
      );

      emit(state.copyWith(
        isAddingPlace: false,
        isPlaceAdded: true,
        images: [],
      ));

      add(const DiscoverEvent.load(null));
    } catch (e, stackTrace) {
      print('Error in _onAddPizzaPlace:'); // Debug log
      print('Error: $e');
      print('Stack trace: $stackTrace');

      _alertManager.showError(
        title: 'Error',
        message: e.toString(),
      );

      emit(state.copyWith(isAddingPlace: false));
    }
  }

  void _onAddPizzaPlaceReview(
    DiscoverAddPlaceReview event,
    Emitter<DiscoverState> emit,
  ) async {
    if (_authBloc.state.status == AuthStateStatus.unauthenticated) {
      _actionIfNotLoggedIn();
      return;
    }

    emit(state.copyWith(showLoading: true));

    try {
      final uploadResponse = await _userRepository.uploadPhotos(
        files: state.images ?? [],
      );

      if (uploadResponse.data == null || uploadResponse.data!.isEmpty) {
        throw Exception('Failed to upload images: No URLs returned');
      }

      Map<String, dynamic> data = Map.from(event.data);
      data["userId"] = _authBloc.state.user?.id;
      data['photos'] = jsonEncode(uploadResponse.data);

      var response = await _userRepository.addPizzaPlaceReview(data: data);

      if (response.success) {
        _alertManager.showSuccess(message: "Review Submitted Successfully!");

        var dataList = await _userRepository.getPizzaPlaceReviews(
          placeId: data["pizzaPlaceId"] ?? '',
        );

        emit(state.copyWith(reviews: dataList));

        try {
          var myReview = dataList.reviews?.firstWhere(
            (review) => review?.user?.id == _authBloc.state.user?.id,
          );
          emit(state.copyWith(myReview: myReview));
        } catch (e) {
          emit(state.copyWith(myReview: null));
        }
      } else {
        _alertManager.showError(message: "Invalid Details");
      }
    } catch (e, stackTrace) {
      print('Error in _onAddPizzaPlaceReview:'); // Debug log
      print('Error: $e');
      print('Stack trace: $stackTrace');

      _alertManager.showError(
        title: 'Error',
        message: e.toString(),
      );
    } finally {
      emit(state.copyWith(showLoading: false));
    }
  }

  void _onSuggestEdit(
    DiscoverSuggestEdit event,
    Emitter<DiscoverState> emit,
  ) async {
    if (_authBloc.state.status == AuthStateStatus.unauthenticated) {
      _actionIfNotLoggedIn();
    }
  }

  void _onSubmitEdit(
    DiscoverSubmitEdit event,
    Emitter<DiscoverState> emit,
  ) async {
    if (_authBloc.state.status == AuthStateStatus.unauthenticated) {
      _actionIfNotLoggedIn();
      return;
    }

    emit(state.copyWith(showLoading: true));

    try {
      Map<String, dynamic> data = Map.from(event.data);

      await _userRepository.editPizzaPlace(data: data);

      _alertManager.showSuccess(
        message:
            "Place updated successfully! Changes will be visible after admin approval.",
      );
    } catch (e) {
      _alertManager.showError(message: "Failed to update place details");
    } finally {
      emit(state.copyWith(showLoading: false));
    }
  }

  void _onSearchLocations(
    DiscoverSearchLocations event,
    Emitter<DiscoverState> emit,
  ) async {
    if (event.query.length < 2) {
      emit(state.copyWith(locationSuggestions: []));
      return;
    }

    try {
      final suggestions =
          await _userRepository.getLocationSuggestionss(event.query);
      emit(state.copyWith(locationSuggestions: suggestions));
    } catch (e) {
      print("Error searching locations: $e"); // Debug log
      emit(state.copyWith(locationSuggestions: []));
    }
  }

  void _onRefresh(
    DiscoverRefresh event,
    Emitter<DiscoverState> emit,
  ) async {
    emit(const DiscoverState());
  }

  void _actionIfNotLoggedIn() async {
    if (_authBloc.state.status == AuthStateStatus.unauthenticated) {
      await Future.delayed(const Duration(milliseconds: 500));
      await _router.push(const WelcomeRoute());
    }
  }
}
