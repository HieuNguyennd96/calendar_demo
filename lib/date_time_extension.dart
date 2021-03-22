extension DateHelpers on DateTime {
  DateTime nextDay() {
    return this.add(Duration(days: 1));
  }

  DateTime previousDay() {
    return this.subtract(Duration(days: 1));
  }
}
