class PlaceDetails {
  final PlaceGeometry? geometry;

  PlaceDetails({this.geometry});

  factory PlaceDetails.fromJson(Map<String, dynamic> json) {
    return PlaceDetails(
      geometry: json['geometry'] != null
          ? PlaceGeometry.fromJson(json['geometry'])
          : null,
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