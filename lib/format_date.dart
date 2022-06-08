
extension MyDateExtension on DateTime {
  DateTime getOnlyDateTime() {
    return DateTime(this.year, this.month, this.day);
  }
}