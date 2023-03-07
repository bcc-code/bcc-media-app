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
