import 'package:flutter/material.dart';

import '../localization/app_localizations.dart';
import 'color_palette.dart';

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

void showToast (String message, BuildContext context) {
  final translate = AppLocalizations.of(context).translate;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(translate(message)),
      duration: const Duration(seconds: 3),
      behavior: SnackBarBehavior.floating, // Makes the snackbar float
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), // Adds margin
      shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      showCloseIcon: true,
      closeIconColor: Colors.white,
      backgroundColor: AppColors.primary,

    ),
  );
}