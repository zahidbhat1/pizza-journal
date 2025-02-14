class LocationSuggestions {
  final String placeId;
  final String description;
  final String mainText;
  final String secondaryText;

  LocationSuggestions({
    required this.placeId,
    required this.description,
    required this.mainText,
    required this.secondaryText,
  });

  factory LocationSuggestions.fromJson(Map<String, dynamic> json) {
    final structuredFormatting = json['structured_formatting'] ?? {};
    return LocationSuggestions(
      placeId: json['place_id'] ?? '',
      description: json['description'] ?? '',
      mainText: structuredFormatting['main_text'] ?? '',
      secondaryText: structuredFormatting['secondary_text'] ?? '',
    );
  }
}
