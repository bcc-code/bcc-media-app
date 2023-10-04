enum Enum$Gender { male, female, unknown, $unknown }

String toJson$Enum$Gender(Enum$Gender e) {
  switch (e) {
    case Enum$Gender.male:
      return r'male';
    case Enum$Gender.female:
      return r'female';
    case Enum$Gender.unknown:
      return r'unknown';
    case Enum$Gender.$unknown:
      return r'$unknown';
  }
}

Enum$Gender fromJson$Enum$Gender(String value) {
  switch (value) {
    case r'male':
      return Enum$Gender.male;
    case r'female':
      return Enum$Gender.female;
    case r'unknown':
      return Enum$Gender.unknown;
    default:
      return Enum$Gender.$unknown;
  }
}
