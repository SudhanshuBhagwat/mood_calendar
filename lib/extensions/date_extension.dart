extension DateParser on DateTime {
  String parseDateToString() {
    return '${this.year}-${this.month}-${this.day}';
  }
}

extension ParseDate on String {
  String parseDateString() {
    List<String> dateA = this.split('-');
    DateTime date = DateTime(
      int.parse(dateA[0]),
      int.parse(dateA[1]),
      int.parse(dateA[2]),
    );
  }
}
