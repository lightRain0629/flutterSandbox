bool hasOneHourPassed(DateTime previousTime) {
  DateTime currentTime = DateTime.now();
  Duration difference = currentTime.difference(previousTime);
  return difference.inHours >= 1;
}
