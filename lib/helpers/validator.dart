import '../app_constants/app_strings.dart';
import '../app_constants/const.dart';

class NameValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return Strings.fieldCannotBeEmpty;
    }

    if (value.length < 2) {
      return Strings.nameTooShort;
    }

    return null;
  }
}

class PasswordValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return Strings.emptyPasswordField;
    }

    if (value.length < 8) {
      return Strings.passwordLengthError;
    }
    final regExp = RegExp(Constants.digitRegex);

    if (!regExp.hasMatch(value)) {
      return Strings.passwordDigitErr;
    }

    final regSymbolExp = RegExp(Constants.symbolRegex);

    if (!regSymbolExp.hasMatch(value)) {
      return Strings.passwordSymbolErr;
    }

    return null;
  }
}
