import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../data/states/discover/discover_bloc.dart';
import '../../../../data/states/discover/discover_event.dart';
import '../../../../data/states/discover/discover_state.dart';
import '../../../themes/colors.dart';

class MapLocationPicker extends StatefulWidget {
  final Function(LatLng) onLocationSelected;

  const MapLocationPicker({
    Key? key,
    required this.onLocationSelected,
  }) : super(key: key);

  @override
  State<MapLocationPicker> createState() => _MapLocationPickerState();
}

class _MapLocationPickerState extends State<MapLocationPicker> {
  GoogleMapController? _mapController;
  LatLng? _selectedLocation;
  Set<Marker> _markers = {};
  bool _isManualUpdate = false;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        Position position = await Geolocator.getCurrentPosition();
        _updateLocation(LatLng(position.latitude, position.longitude),
            isManual: false);
      }
    } catch (e) {
      print('Error getting location: $e');
    }
  }

  void _updateLocation(LatLng location, {bool isManual = false}) {
    if (isManual) {
      _isManualUpdate = true;
    }

    setState(() {
      _selectedLocation = location;
      _markers = {
        Marker(
          markerId: const MarkerId('selected_location'),
          position: location,
          draggable: true,
          onDragEnd: (newPosition) {
            if (!_isManualUpdate) {
              _updateLocation(newPosition, isManual: false);
              widget.onLocationSelected(newPosition);
            }
          },
        ),
      };
    });

    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(target: location, zoom: 15),
      ),
    );

    if (!isManual) {
      getAddressFromLatLng(location.latitude, location.longitude);
      widget.onLocationSelected(location);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.grey2, width: 1),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: BlocListener<DiscoverBloc, DiscoverState>(
          listener: (context, state) {
            if (state.fetchedLocation != null) {
              final location = LatLng(
                state.fetchedLocation!.latitude,
                state.fetchedLocation!.longitude,
              );
              _updateLocation(location, isManual: true);
            }
          },
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: _selectedLocation ?? const LatLng(0, 0),
              zoom: 15,
            ),
            onMapCreated: (controller) => _mapController = controller,
            markers: _markers,
            onTap: (location) {
              if (!_isManualUpdate) {
                _updateLocation(location, isManual: false);
              }
              _isManualUpdate = false;
            },
            myLocationEnabled: true,
            myLocationButtonEnabled: true,
            gestureRecognizers: {}
              ..add(Factory<PanGestureRecognizer>(() => PanGestureRecognizer()))
              ..add(Factory<VerticalDragGestureRecognizer>(
                  () => VerticalDragGestureRecognizer()))
              ..add(Factory<ScaleGestureRecognizer>(
                  () => ScaleGestureRecognizer()))
              ..add(
                  Factory<TapGestureRecognizer>(() => TapGestureRecognizer())),
          ),
        ),
      ),
    );
  }

  Future<void> getAddressFromLatLng(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);

      if (placemarks.isNotEmpty) {
        Placemark place = placemarks.first;
        String street = [place.street?.trim(), place.subLocality?.trim()]
            .where((s) => s != null && s.isNotEmpty)
            .join(" ");

        String pincode = place.postalCode ?? "";
        String city = place.locality ?? "";
        String state = place.administrativeArea ?? "";
        String country = place.country ?? "";

        context.read<DiscoverBloc>().add(LocationSelected(
              street: street,
              pincode: pincode,
              city: city,
              state: state,
              country: country,
            ));
      }
    } catch (e) {
      print("Error fetching address: $e");
    }
  }
}
