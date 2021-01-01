extension DateParser on DateTime {
  String parseDateToString() {
    return '${this.year}-${this.month}-${this.day}';
  }
}
