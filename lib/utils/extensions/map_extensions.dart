extension MapX on Map {
  void writeIfNotNull({
    required String key,
    required dynamic value,
  }) {
    if (value != null) {
      this[key] = value;
    }
  }

  void writeIfNotEmpty({
    required String key,
    required String? value,
  }) {
    if (value?.isNotEmpty ?? false) {
      this[key] = value;
    }
  }
}
