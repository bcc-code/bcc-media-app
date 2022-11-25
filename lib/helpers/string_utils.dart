extension StringExtensions on String? {
  bool get isBlank => this?.trim().isEmpty ?? true;
  String? get capitalize {
    if (isBlank) {
      return this;
    }
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }
}
