class PlaceDetails {
  final PlaceGeometry? geometry;
  final String? pincode; // ✅ Add pincode field

  PlaceDetails({this.geometry, this.pincode});

  factory PlaceDetails.fromJson(Map<String, dynamic> json) {
    // ✅ Extract pincode (postal code) from address_components
    String? pincode;
    for (var component in json['address_components'] ?? []) {
      if (component['types'].contains("postal_code")) {
        pincode = component['long_name'];
        break;
      }
    }

    return PlaceDetails(
      geometry: json['geometry'] != null
          ? PlaceGeometry.fromJson(json['geometry'])
          : null,
      pincode: pincode, // ✅ Store extracted pincode
    );
  }
}

class PlaceGeometry {
  final Location location;

  PlaceGeometry({required this.location});

  factory PlaceGeometry.fromJson(Map<String, dynamic> json) {
    return PlaceGeometry(
      location: Location.fromJson(json['location']),
    );
  }
}

class Location {
  final double lat;
  final double lng;

  Location({required this.lat, required this.lng});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}
