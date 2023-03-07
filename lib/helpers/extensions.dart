extension AsExtension on Object? {
  X as<X>() => this as X;
  X? asOrNull<X>() {
    var self = this;
    return self is X ? self : null;
  }
}

extension FiniteOrNull on double {
  double? finiteOrNull() {
    return isFinite ? this : null;
  }
}

extension StringExtensions on String? {
  bool get isBlank => this?.trim().isEmpty ?? true;
  String? get capitalized {
    if (isBlank) {
      return this;
    }
    return '${this![0].toUpperCase()}${this!.substring(1).toLowerCase()}';
  }
}
