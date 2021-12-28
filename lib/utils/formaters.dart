durationToHms(Duration duration) {
  int totalHours = duration.inHours;
  int totalMinutes = duration.inMinutes;
  int totalSeconds = duration.inSeconds;

  int minutes = totalMinutes % 60;
  int seconds = totalSeconds % 60;

  return "${totalHours.toString().padLeft(2, "0")}:${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
}

durationToMs(Duration duration) {
  int totalMinutes = duration.inMinutes;
  int totalSeconds = duration.inSeconds;

  int minutes = totalMinutes % 60;
  int seconds = totalSeconds % 60;

  return "${minutes.toString().padLeft(2, "0")}:${seconds.toString().padLeft(2, "0")}";
}

obscurePhoneNumber(String phoneNumber) {
  return phoneNumber.replaceRange(0, 6, "******");
}
