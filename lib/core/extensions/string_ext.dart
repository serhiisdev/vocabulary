extension StringExt on String {
  String truncate(int maxLength) {
    return length > maxLength ? substring(0, maxLength) : this;
  }
}
