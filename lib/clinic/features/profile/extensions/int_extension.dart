extension IntExtension on int {
  String mintsToTime() {
    int hours = this ~/ 60;
    int mint = this % 60;
    final period = this < 720 ? "AM" : "PM";
    if (hours == 12) {
      hours = 12;
    } else if (hours > 12) {
      hours = hours - 12;
    } else {
      hours = hours;
    }

    final timeString =
        "${hours.toString().padLeft(2, "0")}:${mint.toString().padLeft(2, "0")} $period ";
    return timeString;
  }
}
