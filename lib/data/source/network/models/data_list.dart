class DataList<T> {
  List<T>? data;

  DataList({
    required this.data,
  });

  factory DataList.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT, {
    required String? dataJsonKeyName,
  }) {
    return DataList<T>(
      data: (json[dataJsonKeyName ?? 'data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.map((d) => d).toList(),
    };
  }
}

extension DataListX<T> on DataList {
  DataList<U> convertData<U>(List<U> newData) {
    return DataList<U>(
      data: newData,
    );
  }
}
