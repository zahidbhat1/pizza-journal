extension ListX on List<String?> {
  String joinWith(String separator) {
    var stringList = this;

    stringList.removeWhere((n) => n?.isEmpty ?? true);

    return stringList.join(separator);
  }
}
