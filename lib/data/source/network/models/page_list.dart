import 'package:pizzajournals/utils/json_parser.dart';

class PageList<T> {
  final int? page;
  final int? count;
  final int? totalItems;
  final int? totalPages;
  final bool? hasPrevPage;
  final bool? hasNextPage;
  List<T>? data;

  PageList({
    required this.page,
    required this.count,
    required this.totalItems,
    required this.totalPages,
    required this.hasPrevPage,
    required this.hasNextPage,
    required this.data,
  });

  factory PageList.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT, {
    required String? dataJsonKeyName,
  }) {
    return PageList<T>(
      page: JsonParser.intOptionalValue(json['page']),
      count: JsonParser.intOptionalValue(json['count']),
      totalItems: JsonParser.intOptionalValue(json['total_items']),
      totalPages: JsonParser.intOptionalValue(json['total_pages']),
      hasPrevPage: JsonParser.boolOptionalValue(json['has_prev_page']),
      hasNextPage: JsonParser.boolOptionalValue(json['has_next_page']),
      data: (json[dataJsonKeyName ?? 'data'] as List<dynamic>?)?.map(fromJsonT).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'page': page,
      'count': count,
      'total_items': totalItems,
      'total_pages': totalPages,
      'has_prev_page': hasPrevPage,
      'has_next_page': hasNextPage,
      'data': data?.map((d) => d).toList(),
    };
  }
}

extension PageListX<T> on PageList {
  PageList<U> convertData<U>(List<U> newData) {
    return PageList<U>(
      page: page,
      count: count,
      totalItems: totalItems,
      totalPages: totalPages,
      hasPrevPage: hasPrevPage,
      hasNextPage: hasNextPage,
      data: newData,
    );
  }
}
