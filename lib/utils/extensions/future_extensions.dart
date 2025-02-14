extension FutureErrorX<T> on Future<T> {
  Future<void> suppressError() async {
    try {
      await this;
    } catch (e) {
      return;
    }
  }
}
