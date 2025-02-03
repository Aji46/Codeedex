class ValidationUtils {
  static var validateUsername;

  static String? validate(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    } else if (value.contains(' ')) {
      return 'Spaces are not allowed in $fieldName';
    }
    return null;
  }

  static String? validateemail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    } else if (!RegExp(r'^[\w-]+(\.[\w-]+)*@gmail\.com$').hasMatch(value)) {
      return 'Please enter a valid Email address';
    }
    return null;
  }
}
