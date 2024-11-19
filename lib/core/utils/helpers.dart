String formatDate(String date) {
  return DateTime.parse(date).toLocal().toString();
}

String formatTime(String time) {
  return DateTime.parse(time).toLocal().toString();
}

String formatDateTime(String dateTime) {
  return DateTime.parse(dateTime).toLocal().toString();
}

String formatDuration(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return '$twoDigitMinutes:$twoDigitSeconds';
}

String formatDurationToHours(Duration duration) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final twoDigitHours = twoDigits(duration.inHours.remainder(24));
  final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
  final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
  return '$twoDigitHours:$twoDigitMinutes:$twoDigitSeconds';
}