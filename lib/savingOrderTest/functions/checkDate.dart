DateTime parseDate(String? date) {
  if (date == null) {
    return DateTime.now();
  } else {
    try {
      return DateTime.parse(date);
    } catch (err) {
      return DateTime.now();
    }
  }
}

