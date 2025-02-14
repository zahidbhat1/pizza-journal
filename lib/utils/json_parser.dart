class JsonParser {
  static int intValue(
    dynamic value, {
    int defaultValue = 0,
  }) {
    if (value == null) return defaultValue;
    if (value.runtimeType == int) return value;
    try {
      return int.tryParse(value) ?? defaultValue;
    } catch (_) {
      return defaultValue;
    }
  }

  static int? intOptionalValue(dynamic value) {
    if (value == null) return null;
    if (value.runtimeType == int) return value;
    try {
      return int.tryParse(value);
    } catch (_) {
      return null;
    }
  }

  static double doubleValue(
    dynamic value, {
    double defaultValue = 0.0,
  }) {
    if (value == null) return defaultValue;
    if (value.runtimeType == int) return value.toDouble();
    if (value.runtimeType == double) return value;
    try {
      return double.tryParse(value) ?? defaultValue;
    } catch (_) {
      return defaultValue;
    }
  }

  static double? doubleOptionalValue(dynamic value) {
    if (value == null) return null;
    if (value.runtimeType == int) return value.toDouble();
    if (value.runtimeType == double) return value;
    try {
      return double.tryParse(value);
    } catch (_) {
      return null;
    }
  }

  static String stringValue(
    dynamic value, {
    String defaultValue = '',
  }) {
    if (value == null) return defaultValue;
    return '$value';
  }

  static String? stringOptionalValue(dynamic value) {
    if (value == null) return null;
    return '$value';
  }

  static bool boolValue(
    dynamic value, {
    bool defaultValue = false,
  }) {
    if (value == null) return defaultValue;
    if (value.runtimeType == bool) return value;
    if (value.runtimeType == String) return value.toLowerCase() == 'true' || value == '1';
    if (value.runtimeType == int) return value == 1;
    return defaultValue;
  }

  static bool? boolOptionalValue(dynamic value) {
    if (value == null) return null;
    if (value.runtimeType == bool) return value;
    if (value.runtimeType == String) return value.toLowerCase() == 'true' || value == '1';
    if (value.runtimeType == int) return value == 1;
    return null;
  }
}
