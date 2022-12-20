class BaseFunctions {
  static BaseFunctions? _instance;
  static BaseFunctions? get instance {
    _instance ??= BaseFunctions._init();
    return _instance;
  }

  BaseFunctions._init();

  String? toShortString(String? value, {int countCharacter = 8}) {
    return value != null
        ? value.length > countCharacter
            ? "${value.substring(0, countCharacter)} ..."
            : value
        : null;
  }

}
