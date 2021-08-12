class Locale {
  final String value;

  static const Locale EN = Locale('en');
  static const Locale TR = Locale('tr');

  const Locale(this.value);

  @override
  String toString() {
    return value;
  }
}
