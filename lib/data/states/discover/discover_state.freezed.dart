// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'discover_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DiscoverState {
  String? get email => throw _privateConstructorUsedError;
  List<PizzaPlaceModel> get pizzaPlaces => throw _privateConstructorUsedError;
  List<File?> get images => throw _privateConstructorUsedError;
  PizzaReviewModel? get reviews => throw _privateConstructorUsedError;
  Review? get myReview => throw _privateConstructorUsedError;
  bool get showLoading => throw _privateConstructorUsedError;
  bool get isAddingPlace => throw _privateConstructorUsedError;
  bool get isPlaceAdded => throw _privateConstructorUsedError;
  String get street => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get stateName => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  DataItem<void>? get addReviewResponse => throw _privateConstructorUsedError;
  List<LocationSuggestions> get locationSuggestions =>
      throw _privateConstructorUsedError;
  LatLng? get fetchedLocation => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DiscoverStateCopyWith<DiscoverState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiscoverStateCopyWith<$Res> {
  factory $DiscoverStateCopyWith(
          DiscoverState value, $Res Function(DiscoverState) then) =
      _$DiscoverStateCopyWithImpl<$Res, DiscoverState>;
  @useResult
  $Res call(
      {String? email,
      List<PizzaPlaceModel> pizzaPlaces,
      List<File?> images,
      PizzaReviewModel? reviews,
      Review? myReview,
      bool showLoading,
      bool isAddingPlace,
      bool isPlaceAdded,
      String street,
      String pincode,
      String city,
      String stateName,
      String country,
      DataItem<void>? addReviewResponse,
      List<LocationSuggestions> locationSuggestions,
      LatLng? fetchedLocation});

  $PizzaReviewModelCopyWith<$Res>? get reviews;
  $ReviewCopyWith<$Res>? get myReview;
}

/// @nodoc
class _$DiscoverStateCopyWithImpl<$Res, $Val extends DiscoverState>
    implements $DiscoverStateCopyWith<$Res> {
  _$DiscoverStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? pizzaPlaces = null,
    Object? images = null,
    Object? reviews = freezed,
    Object? myReview = freezed,
    Object? showLoading = null,
    Object? isAddingPlace = null,
    Object? isPlaceAdded = null,
    Object? street = null,
    Object? pincode = null,
    Object? city = null,
    Object? stateName = null,
    Object? country = null,
    Object? addReviewResponse = freezed,
    Object? locationSuggestions = null,
    Object? fetchedLocation = freezed,
  }) {
    return _then(_value.copyWith(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pizzaPlaces: null == pizzaPlaces
          ? _value.pizzaPlaces
          : pizzaPlaces // ignore: cast_nullable_to_non_nullable
              as List<PizzaPlaceModel>,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File?>,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as PizzaReviewModel?,
      myReview: freezed == myReview
          ? _value.myReview
          : myReview // ignore: cast_nullable_to_non_nullable
              as Review?,
      showLoading: null == showLoading
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddingPlace: null == isAddingPlace
          ? _value.isAddingPlace
          : isAddingPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaceAdded: null == isPlaceAdded
          ? _value.isPlaceAdded
          : isPlaceAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      stateName: null == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      addReviewResponse: freezed == addReviewResponse
          ? _value.addReviewResponse
          : addReviewResponse // ignore: cast_nullable_to_non_nullable
              as DataItem<void>?,
      locationSuggestions: null == locationSuggestions
          ? _value.locationSuggestions
          : locationSuggestions // ignore: cast_nullable_to_non_nullable
              as List<LocationSuggestions>,
      fetchedLocation: freezed == fetchedLocation
          ? _value.fetchedLocation
          : fetchedLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PizzaReviewModelCopyWith<$Res>? get reviews {
    if (_value.reviews == null) {
      return null;
    }

    return $PizzaReviewModelCopyWith<$Res>(_value.reviews!, (value) {
      return _then(_value.copyWith(reviews: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewCopyWith<$Res>? get myReview {
    if (_value.myReview == null) {
      return null;
    }

    return $ReviewCopyWith<$Res>(_value.myReview!, (value) {
      return _then(_value.copyWith(myReview: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DiscoverStateImplCopyWith<$Res>
    implements $DiscoverStateCopyWith<$Res> {
  factory _$$DiscoverStateImplCopyWith(
          _$DiscoverStateImpl value, $Res Function(_$DiscoverStateImpl) then) =
      __$$DiscoverStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? email,
      List<PizzaPlaceModel> pizzaPlaces,
      List<File?> images,
      PizzaReviewModel? reviews,
      Review? myReview,
      bool showLoading,
      bool isAddingPlace,
      bool isPlaceAdded,
      String street,
      String pincode,
      String city,
      String stateName,
      String country,
      DataItem<void>? addReviewResponse,
      List<LocationSuggestions> locationSuggestions,
      LatLng? fetchedLocation});

  @override
  $PizzaReviewModelCopyWith<$Res>? get reviews;
  @override
  $ReviewCopyWith<$Res>? get myReview;
}

/// @nodoc
class __$$DiscoverStateImplCopyWithImpl<$Res>
    extends _$DiscoverStateCopyWithImpl<$Res, _$DiscoverStateImpl>
    implements _$$DiscoverStateImplCopyWith<$Res> {
  __$$DiscoverStateImplCopyWithImpl(
      _$DiscoverStateImpl _value, $Res Function(_$DiscoverStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? email = freezed,
    Object? pizzaPlaces = null,
    Object? images = null,
    Object? reviews = freezed,
    Object? myReview = freezed,
    Object? showLoading = null,
    Object? isAddingPlace = null,
    Object? isPlaceAdded = null,
    Object? street = null,
    Object? pincode = null,
    Object? city = null,
    Object? stateName = null,
    Object? country = null,
    Object? addReviewResponse = freezed,
    Object? locationSuggestions = null,
    Object? fetchedLocation = freezed,
  }) {
    return _then(_$DiscoverStateImpl(
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      pizzaPlaces: null == pizzaPlaces
          ? _value._pizzaPlaces
          : pizzaPlaces // ignore: cast_nullable_to_non_nullable
              as List<PizzaPlaceModel>,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File?>,
      reviews: freezed == reviews
          ? _value.reviews
          : reviews // ignore: cast_nullable_to_non_nullable
              as PizzaReviewModel?,
      myReview: freezed == myReview
          ? _value.myReview
          : myReview // ignore: cast_nullable_to_non_nullable
              as Review?,
      showLoading: null == showLoading
          ? _value.showLoading
          : showLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isAddingPlace: null == isAddingPlace
          ? _value.isAddingPlace
          : isAddingPlace // ignore: cast_nullable_to_non_nullable
              as bool,
      isPlaceAdded: null == isPlaceAdded
          ? _value.isPlaceAdded
          : isPlaceAdded // ignore: cast_nullable_to_non_nullable
              as bool,
      street: null == street
          ? _value.street
          : street // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      stateName: null == stateName
          ? _value.stateName
          : stateName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      addReviewResponse: freezed == addReviewResponse
          ? _value.addReviewResponse
          : addReviewResponse // ignore: cast_nullable_to_non_nullable
              as DataItem<void>?,
      locationSuggestions: null == locationSuggestions
          ? _value._locationSuggestions
          : locationSuggestions // ignore: cast_nullable_to_non_nullable
              as List<LocationSuggestions>,
      fetchedLocation: freezed == fetchedLocation
          ? _value.fetchedLocation
          : fetchedLocation // ignore: cast_nullable_to_non_nullable
              as LatLng?,
    ));
  }
}

/// @nodoc

class _$DiscoverStateImpl implements _DiscoverState {
  const _$DiscoverStateImpl(
      {this.email,
      final List<PizzaPlaceModel> pizzaPlaces = const [],
      final List<File?> images = const [],
      this.reviews = null,
      this.myReview = null,
      this.showLoading = false,
      this.isAddingPlace = false,
      this.isPlaceAdded = false,
      this.street = '',
      this.pincode = '',
      this.city = '',
      this.stateName = '',
      this.country = '',
      this.addReviewResponse = null,
      final List<LocationSuggestions> locationSuggestions = const [],
      this.fetchedLocation})
      : _pizzaPlaces = pizzaPlaces,
        _images = images,
        _locationSuggestions = locationSuggestions;

  @override
  final String? email;
  final List<PizzaPlaceModel> _pizzaPlaces;
  @override
  @JsonKey()
  List<PizzaPlaceModel> get pizzaPlaces {
    if (_pizzaPlaces is EqualUnmodifiableListView) return _pizzaPlaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pizzaPlaces);
  }

  final List<File?> _images;
  @override
  @JsonKey()
  List<File?> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final PizzaReviewModel? reviews;
  @override
  @JsonKey()
  final Review? myReview;
  @override
  @JsonKey()
  final bool showLoading;
  @override
  @JsonKey()
  final bool isAddingPlace;
  @override
  @JsonKey()
  final bool isPlaceAdded;
  @override
  @JsonKey()
  final String street;
  @override
  @JsonKey()
  final String pincode;
  @override
  @JsonKey()
  final String city;
  @override
  @JsonKey()
  final String stateName;
  @override
  @JsonKey()
  final String country;
  @override
  @JsonKey()
  final DataItem<void>? addReviewResponse;
  final List<LocationSuggestions> _locationSuggestions;
  @override
  @JsonKey()
  List<LocationSuggestions> get locationSuggestions {
    if (_locationSuggestions is EqualUnmodifiableListView)
      return _locationSuggestions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_locationSuggestions);
  }

  @override
  final LatLng? fetchedLocation;

  @override
  String toString() {
    return 'DiscoverState(email: $email, pizzaPlaces: $pizzaPlaces, images: $images, reviews: $reviews, myReview: $myReview, showLoading: $showLoading, isAddingPlace: $isAddingPlace, isPlaceAdded: $isPlaceAdded, street: $street, pincode: $pincode, city: $city, stateName: $stateName, country: $country, addReviewResponse: $addReviewResponse, locationSuggestions: $locationSuggestions, fetchedLocation: $fetchedLocation)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiscoverStateImpl &&
            (identical(other.email, email) || other.email == email) &&
            const DeepCollectionEquality()
                .equals(other._pizzaPlaces, _pizzaPlaces) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.reviews, reviews) || other.reviews == reviews) &&
            (identical(other.myReview, myReview) ||
                other.myReview == myReview) &&
            (identical(other.showLoading, showLoading) ||
                other.showLoading == showLoading) &&
            (identical(other.isAddingPlace, isAddingPlace) ||
                other.isAddingPlace == isAddingPlace) &&
            (identical(other.isPlaceAdded, isPlaceAdded) ||
                other.isPlaceAdded == isPlaceAdded) &&
            (identical(other.street, street) || other.street == street) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.stateName, stateName) ||
                other.stateName == stateName) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.addReviewResponse, addReviewResponse) ||
                other.addReviewResponse == addReviewResponse) &&
            const DeepCollectionEquality()
                .equals(other._locationSuggestions, _locationSuggestions) &&
            (identical(other.fetchedLocation, fetchedLocation) ||
                other.fetchedLocation == fetchedLocation));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      email,
      const DeepCollectionEquality().hash(_pizzaPlaces),
      const DeepCollectionEquality().hash(_images),
      reviews,
      myReview,
      showLoading,
      isAddingPlace,
      isPlaceAdded,
      street,
      pincode,
      city,
      stateName,
      country,
      addReviewResponse,
      const DeepCollectionEquality().hash(_locationSuggestions),
      fetchedLocation);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DiscoverStateImplCopyWith<_$DiscoverStateImpl> get copyWith =>
      __$$DiscoverStateImplCopyWithImpl<_$DiscoverStateImpl>(this, _$identity);
}

abstract class _DiscoverState implements DiscoverState {
  const factory _DiscoverState(
      {final String? email,
      final List<PizzaPlaceModel> pizzaPlaces,
      final List<File?> images,
      final PizzaReviewModel? reviews,
      final Review? myReview,
      final bool showLoading,
      final bool isAddingPlace,
      final bool isPlaceAdded,
      final String street,
      final String pincode,
      final String city,
      final String stateName,
      final String country,
      final DataItem<void>? addReviewResponse,
      final List<LocationSuggestions> locationSuggestions,
      final LatLng? fetchedLocation}) = _$DiscoverStateImpl;

  @override
  String? get email;
  @override
  List<PizzaPlaceModel> get pizzaPlaces;
  @override
  List<File?> get images;
  @override
  PizzaReviewModel? get reviews;
  @override
  Review? get myReview;
  @override
  bool get showLoading;
  @override
  bool get isAddingPlace;
  @override
  bool get isPlaceAdded;
  @override
  String get street;
  @override
  String get pincode;
  @override
  String get city;
  @override
  String get stateName;
  @override
  String get country;
  @override
  DataItem<void>? get addReviewResponse;
  @override
  List<LocationSuggestions> get locationSuggestions;
  @override
  LatLng? get fetchedLocation;
  @override
  @JsonKey(ignore: true)
  _$$DiscoverStateImplCopyWith<_$DiscoverStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
