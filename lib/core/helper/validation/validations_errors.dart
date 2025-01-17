enum ValidationType { email, number, any, password }

class ValidationHelper {
  static String? validate({
    required String value,
    required ValidationType validationType,
    required int minValue,
    required int maxValue,
  }) {
    if (validationType == ValidationType.email) {
      if (!hasMatch(value,
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')) {
        return 'Please enter a valid email';
      }
    } else if (validationType == ValidationType.number) {
      if (!hasMatch(value, r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')) {
        return 'Please enter a valid phone number';
      }
    }
    if (value.isEmpty) {
      return "This field is required";
    }
    if (value.length < minValue) {
      return "${"Can't be less than"} $minValue";
    }
    if (value.length > maxValue) {
      return "${"Can't be more than"} $maxValue";
    }
    return null;
  }

  static bool hasMatch(String? value, String pattern) {
    return (value == null) ? false : RegExp(pattern).hasMatch(value);
  }
}
