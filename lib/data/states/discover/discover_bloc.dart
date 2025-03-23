import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:pizzajournals/data/repositories/user_repository.dart';
import 'package:pizzajournals/data/source/network/extensions/app_error_extension.dart';
import 'package:pizzajournals/data/states/action/action_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_bloc.dart';
import 'package:pizzajournals/data/states/auth/auth_state.dart';
import 'package:pizzajournals/data/states/discover/discover_event.dart';
import 'package:pizzajournals/data/states/discover/discover_state.dart';
import 'package:pizzajournals/presenter/navigation/navigation.dart';
import 'package:pizzajournals/presenter/pages/discover/place_detail_arguments.dart';
import 'package:pizzajournals/utils/alert_manager.dart';

import '../../../utils/error_types.dart';
import '../../source/error/app_exception.dart';

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
    on<DiscoverSelectPizzaType>(_onSelectPizzaType);
    on<FetchPlaceDetails>(_onFetchPlaceDetails);
    on<DiscoverUpdatePlaceReview>(_onUpdatePizzaPlaceReview);
  }



  void _onUpdatePizzaPlaceReview(
      DiscoverUpdatePlaceReview event,
      Emitter<DiscoverState> emit,
      ) async {
    if (_authBloc.state.status == AuthStateStatus.unauthenticated) {
      _actionIfNotLoggedIn();
      return;
    }

    emit(state.copyWith(showLoading: true));

    try {
      List<String> photoUrls = [];
      if (state.images != null && state.images!.isNotEmpty) {
        final uploadResponse = await _userRepository.uploadPhotos(
          files: state.images ?? [],
        );

        if (uploadResponse.data == null || uploadResponse.data!.isEmpty) {
          throw Exception('Failed to upload images: No URLs returned');
        }
        photoUrls = uploadResponse.data!;
      }

      Map<String, dynamic> data = Map.from(event.data);
     // data["userId"] = _authBloc.state.user?.id;
      if (photoUrls.isNotEmpty) {
        data['photos'] = jsonEncode(photoUrls);
      }

      var response = await _userRepository.updatePizzaPlaceReview(
        data: data,
        reviewId: event.reviewId,
      );

      if (response.success) {
        _alertManager.showSuccess(message: "Review Updated Successfully!");

        // Refresh the reviews to show the updated one
        var dataList = await _userRepository.getPizzaPlaceReviews(
          placeId: data["pizzaPlaceId"] ?? '',
        );

        emit(state.copyWith(reviews: dataList));

        try {
          var myReview = dataList.reviews?.firstWhere(
                (review) =>
            review?.user?.id == _authBloc.state.user?.id &&
                review?.pizzaType == data["pizzaType"],
          );
          emit(state.copyWith(myReview: myReview));
        } catch (e) {
          emit(state.copyWith(myReview: null));
        }
      } else {
        _alertManager.showError(message: "Failed to update review");
      }
    } catch (e, stackTrace) {
      print('Error in _onUpdatePizzaPlaceReview:');
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
  void _onLoad(
      DiscoverLoad event,
      Emitter<DiscoverState> emit,
      ) async {
    emit(state.copyWith(showLoading: true));

    try {
      print("Fetching pizza places from API...");
      var dataList = await _userRepository.getPizzaPlaces(event.request);
      print("API Response: ${dataList.data}");

      emit(state.copyWith(
        showLoading: false,
        pizzaPlaces: dataList.data ?? [],
      ));

    } catch (e) {
      print("Error fetching pizza places: $e");

      // ✅ Since `getPizzaPlaces()` already throws `ServerException`, use it directly
      final serverException = e is ServerException ? e : ServerException(
        type: ServerExceptionType.unknown,
        message: "An unexpected error occurred.",
      );

      print("ServerException type: ${serverException.type}, message: ${serverException.message}");

      _alertManager.showError(
        title: 'Error',
        message: getErrorMessage(serverException), // ✅ Clean message
      );

      emit(state.copyWith(
        showLoading: false,
        pizzaPlaces: [], // Clear places on error
      ));
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


  void _onSelectPizzaType(
      DiscoverSelectPizzaType event,
      Emitter<DiscoverState> emit,
      ) {
    emit(state.copyWith(selectedPizzaType: event.pizzaType));
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
        userPizzaPlaces: dataList.data ?? [],
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
      Emitter emit,
      ) async {
    emit(state.copyWith(showLoading: true, myReview: null));

    try {
      var dataList = await _userRepository.getPizzaPlaceReviews(
        placeId: event.pizzaPlaceModel?.id ?? '',
      );


      final availablePizzaTypes = dataList.summaries?.keys.toList() ?? [];
      print('Available pizza types: $availablePizzaTypes');


      final defaultPizzaType = state.selectedPizzaType.isNotEmpty && availablePizzaTypes.contains(state.selectedPizzaType)
          ? state.selectedPizzaType
          : availablePizzaTypes.contains("Traditional Round")
          ? "Traditional Round"
          : (availablePizzaTypes.isNotEmpty ? availablePizzaTypes.first : "");

      emit(state.copyWith(
        reviews: dataList,
        selectedPizzaType: defaultPizzaType,
        showLoading: false,
      ));


    } catch (e) {
      print("Error fetching reviews: $e");
      emit(state.copyWith(
        showLoading: false,
        reviews: null,
        selectedPizzaType: "",
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
    if (state.images == null || state.images!.isEmpty) {
    _alertManager.showValidation(
    message: "Please select at least one image"
    );
    return;
    }

    try {
      List<String> photoUrls = [];
      emit(state.copyWith(isAddingPlace: true));


      if (state.images != null && state.images!.isNotEmpty) {
        final uploadResponse = await _userRepository.uploadPhotos(
          files: state.images ?? [],
        );

        if (uploadResponse.data == null || uploadResponse.data!.isEmpty) {
          throw Exception('Failed to upload images: No URLs returned');
        }

        photoUrls = uploadResponse.data!;
      }
      // Prepare form data
      Map<String, dynamic> formData = Map<String, dynamic>.from(event.data);
      if (photoUrls.isNotEmpty) {
        formData['photos'] = jsonEncode(photoUrls);
      }
      // Add new place - this will return PizzaPlaceModel on success or throw exception on failure
      final newPlace = await _userRepository.addPizzaPlace(
        data: formData,
        files: [],
      );


      // If we reach here, it means the request was successful
      _alertManager.showSuccess(
        title: 'Success',
        message: 'Pizza Place Added Successfully',
      );

      emit(state.copyWith(
        isAddingPlace: false,
        newlyAddedPlace: newPlace,
        isPlaceAdded: true,
        images: [],
      ));

      Future.delayed(Duration(milliseconds: 1000), () {


        _router.push(
          PizzaPlaceRoute(
            arguments: PizzaPlaceArguments(
              pizzaPlaceModel: newPlace,
            ),
          ),
        );
      });

      // Reload places
      add(const DiscoverEvent.load(null));
    } catch (e, stackTrace) {
      print('Error in _onAddPizzaPlace:');
      print('Error: $e');
      print('Stack trace: $stackTrace');

      // Extract just the error message without the "Exception:" prefix
      String errorMessage = e.toString();
      if (errorMessage.startsWith("Exception: ")) {
        errorMessage = errorMessage.substring("Exception: ".length);
      }

      _alertManager.showError(
        title: 'Error',
        message: errorMessage,
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
    //
    // if (state.images == null || state.images!.isEmpty) {
    //   _alertManager.showValidation(
    //       message: "Please select at least one image"
    //   );
    //   return;
    // }

    emit(state.copyWith(showLoading: true));

    try {
      List<String> photoUrls = [];
      if (state.images != null && state.images!.isNotEmpty) {
        final uploadResponse = await _userRepository.uploadPhotos(
          files: state.images ?? [],
        );

        if (uploadResponse.data == null || uploadResponse.data!.isEmpty) {
          throw Exception('Failed to upload images: No URLs returned');
        }
        photoUrls = uploadResponse.data!;
      }

      Map<String, dynamic> data = Map.from(event.data);
      data["userId"] = _authBloc.state.user?.id;
      if (photoUrls.isNotEmpty) {
        data['photos'] = jsonEncode(photoUrls);
      }

      var response = await _userRepository.addPizzaPlaceReview(data: data);

      if (response.success) {
        _alertManager.showSuccess(message: "Review Submitted Successfully!");

        var dataList = await _userRepository.getPizzaPlaceReviews(
          placeId: data["pizzaPlaceId"] ?? '',
        );

        emit(state.copyWith(reviews: dataList));

        try {
          var myReview = dataList.reviews?.firstWhere(
                (review) =>
            review?.user?.id == _authBloc.state.user?.id &&
                review?.pizzaType == data["pizzaType"], // Check pizza type
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

  void _onFetchPlaceDetails(
      FetchPlaceDetails event,
      Emitter<DiscoverState> emit,
      ) async {
    try {
      emit(state.copyWith(showLoading: true));

      final placeDetails = await _userRepository.getPlaceDetails(event.placeId);

      final lat = placeDetails.geometry?.location.lat ?? 0.0;
      final lng = placeDetails.geometry?.location.lng ?? 0.0;
      final newLocation = LatLng(lat, lng);
      final mapLink = "https://www.google.com/maps?q=$lat,$lng";
      final pinCode= placeDetails.pincode;

      print('Map Link: $mapLink');
      print("Pincode: $pinCode"); // ✅ Debug pincode

      emit(state.copyWith(
        selectedMapLocation: newLocation,
        isMapInteractionEnabled: false,
        mapLink: mapLink,
        pincode: placeDetails.pincode.toString(), // ✅ Store pincode in state
        showLoading: false,
      ));
    } catch (e) {
      print("Error fetching place details: $e");
      emit(state.copyWith(showLoading: false));
    }
  }


  void _onSearchLocations(
    DiscoverSearchLocations event,
    Emitter<DiscoverState> emit,
  ) async {
    if (event.query.length < 2) {
      print("Clearing suggestions...");
      emit(state.copyWith(locationSuggestions: []));
      print("Updated suggestions: ${state.locationSuggestions}");
      return;
    }

    try {
      final suggestions =
          await _userRepository.getLocationSuggestionss(event.query);
      print("Fetched suggestions: $suggestions");
      emit(state.copyWith(locationSuggestions: suggestions));
    } catch (e) {
      print("Error searching locations: $e");
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
