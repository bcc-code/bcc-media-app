bool isUnavailable(String? publishDate) {
  if (publishDate == null) {
    return false;
  }
  final parsedDateTime = DateTime.tryParse(publishDate);
  if (parsedDateTime == null) {
    return false;
  }
  return DateTime.now().isBefore(parsedDateTime);
}

/// True if episode is not available yet but will be available before 2 days from now
bool isComingSoon({required String? publishDate, required bool locked}) {
  if (publishDate == null) {
    return false;
  }
  final publishDateTime = DateTime.tryParse(publishDate);
  if (publishDateTime == null) {
    return false;
  }
  return locked && DateTime.now().add(const Duration(days: 2)).isAfter(publishDateTime);
}

/// True if startTime < now < endTime
bool isLiveNow(String startTime, String endTime) {
  final now = DateTime.now();
  final end = DateTime.tryParse(endTime)?.toLocal();
  final start = DateTime.tryParse(startTime)?.toLocal();
  if (start == null || end == null) {
    return false;
  }
  return end.isAfter(now) && start.isBefore(now);
}

/// True if publishDate > (now - 7 days)
bool isNewEpisode(String? publishDate) {
  if (publishDate == null) {
    return false;
  }
  final publishDateTime = DateTime.tryParse(publishDate);
  if (publishDateTime == null) {
    return false;
  }
  return publishDateTime.isAfter(DateTime.now().subtract(const Duration(days: 7)));
}
